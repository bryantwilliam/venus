import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../auth_gate.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phone;

  const PhoneVerificationPage({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  int? resendToken = null;
  final pinController = TextEditingController();
  String? verificationCode = null;

  @override
  Widget build(BuildContext context) {
    verify(widget.phone, null);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Pinput(
              controller: pinController,
              length: 6,
              onCompleted: (pin) async {
                print("Pin: " + pin);

                await FirebaseAuth.instance.signInWithCredential(
                    PhoneAuthProvider.credential(
                        smsCode: pin, verificationId: verificationCode!));
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            if (resendToken != null)
              ElevatedButton(
                child: Text("Resend"),
                onPressed: () {
                  verify(widget.phone, resendToken);
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> verify(String phone, int? resendToken) async {
    var auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      forceResendingToken: resendToken,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // NOTICE This handler will only be called on Android devices which support automatic SMS code resolution.
        print("Verified: " + phone);
        setState(() {
          pinController.text = credential.smsCode!;
        });
        await FirebaseAuth.instance.signInWithCredential(credential);

        // TODO continue to next part of signup or login if already have acc
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
        setState(() {
          this.resendToken = resendTok;
        });
        verificationCode = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("codeAutoRetrievalTimeout.");
        verificationCode = verificationId;
      },
    );
  }
}
