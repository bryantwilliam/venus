import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:venus/pages/sign_up/email_signup_page.dart';
import 'package:venus/pages/sign_up/other_credentials_signup_page.dart';
import 'package:venus/utils/auth_utils.dart';

import '../../auth_gate.dart';
import '../../utils/nav_utils.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phone;
  final bool isFacebookSignup;

  const PhoneVerificationPage({
    this.isFacebookSignup = false,
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  int? resendToken;
  final pinController = TextEditingController();
  String? verificationCode;

  @override
  Widget build(BuildContext context) {
    // TODO make sure code is sent from verify() before everything can be used. And give eerror messages.
    // BUG this is to fix the bug where when u go back it has an error

    if (resendToken == null) {
      // If the code hasn't been sent yet (and thus no resend token)
      verify(widget.phone, null);
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Pinput(
              autofocus: true,
              controller: pinController,
              length: 6,
              onCompleted: (pin) async {
                print("Pin: " + pin);

                await signInWithPhoneCred(PhoneAuthProvider.credential(
                    smsCode: pin, verificationId: verificationCode!));
              },
            ),
            ElevatedButton(
              child: Text("Resend"),
              onPressed: resendToken == null
                  ? null
                  : () {
                      verify(widget.phone, resendToken);
                    },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInWithPhoneCred(PhoneAuthCredential cred) async {
    Widget nextPageInSignup;

    await FirebaseAuth.instance.signInWithCredential(cred);
    // TODO do error checking on this Future.

    if (!isUserSignedIn()) {
      // TODO handle error
      // TODO maybe use Navigator.pop(context); to go back to phone_signup_page
      // TODO error message to user.
      return;
    }

    User user = FirebaseAuth.instance.currentUser!;

    if (!hasPhoneLinked(user)) {
      // TODO handle error
      // TODO maybe use Navigator.pop(context); to go back to phone_signup_page
      // TODO error message to user.
      return;
    }

    if (!isUserIncomplete()) {
      popAllPagesToFirst(
          context); // If the user is complete, log the user in by popping all the signup pages.
      return;
    }

    if (widget.isFacebookSignup) {
      // NOTICE remove in production
      assert(hasEmailLinked(user)); // NOTICE remove in production

      nextPageInSignup = OtherCredentialsSignupPage();
    } else {
      nextPageInSignup = EmailSignupPage();
    }
    pushNextPage(
      context,
      nextPageInSignup,
      pushReplace: true,
    );
  }

  Future<void> verify(String phone, int? resendToken) async {
    var auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: phone,
      forceResendingToken: resendToken,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // NOTICE This handler will only be called on Android devices which support automatic SMS code resolution.
        print("Verified: " + phone);
        setState(() {
          pinController.text = credential.smsCode!;
        });
        await FirebaseAuth.instance.signInWithCredential(credential);
        signInWithPhoneCred(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Failed to verifiy: " + phone);
        print("Error: " + e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.pop(context);
      },
      codeSent: (String verificationId, int? resendTok) {
        print("Code sent to: " + phone);
        verificationCode = verificationId;
        setState(() {
          this.resendToken =
              resendTok; // TODO Add a timer to this. Maybe make it can only re-send every 30 seconds.
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // For when auto retrieval times out
        print("codeAutoRetrievalTimeout.");
        verificationCode = verificationId;
      },
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}
