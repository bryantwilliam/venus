import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venus/models/sign_up/phone_verification_details.dart';
import 'package:venus/utils/auth_utils.dart';

import '../../utils/nav_utils.dart';
import 'email_signup_page.dart';
import 'other_credentials_signup_page.dart';
import 'phone_pincode_page.dart';

class PhoneSignUpPage extends StatefulWidget {
  final bool isFacebookSignup;

  const PhoneSignUpPage({
    this.isFacebookSignup = false,
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneSignUpPage> createState() => _PhoneSignUpPageState();
}

class _PhoneSignUpPageState extends State<PhoneSignUpPage> {
  final TextEditingController _phoneController = TextEditingController();
  String countryDigits = "+00";
  bool validPhoneNumber = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CountryCodePicker(
                  showDropDownButton: true,
                  dialogBackgroundColor: Colors.red.withOpacity(0.6),
                  initialSelection: 'NZ',
                  padding: EdgeInsets.all(0),
                  onChanged: (countryCode) {
                    countryDigits = countryCode.dialCode!;
                  },
                  onInit: (countryCode) {
                    countryDigits = countryCode!.dialCode!;
                  },
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: TextField(
                      onChanged: (changed) {
                        // TODO check if it's a valid phone number
                        // TODO Check if country code has been set

                        setState(() {
                          validPhoneNumber = true;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                      ),
                      maxLength: 12,
                      keyboardType: TextInputType.number,
                      controller: _phoneController,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text("Send verification code"),
              onPressed: validPhoneNumber
                  ? () async {
                      String phone = countryDigits + _phoneController.text;
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verify(String phone, {resendToken}) async {
    var auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: phone,
      forceResendingToken: resendToken,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // NOTICE This handler will only be called on Android devices which support automatic SMS code resolution.
        print("Automatically verified: " + phone);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Failed to verifiy: " + phone);
        var errorMsg = e.message.toString();
        print("Error: " + errorMsg);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.pop(context);
      },
      codeSent: (String verificationId, int? resendTok) {},
      codeAutoRetrievalTimeout: (String verificationId) {
        // For when auto pin retrieval times out
      },
    );
  }

  Future<void> signInOrContinue(PhoneAuthCredential cred) async {
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

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
