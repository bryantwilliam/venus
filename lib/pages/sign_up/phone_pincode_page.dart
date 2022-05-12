import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:venus/pages/sign_up/email_signup_page.dart';
import 'package:venus/pages/sign_up/other_credentials_signup_page.dart';
import 'package:venus/utils/auth_utils.dart';

import '../../auth_gate.dart';
import '../../utils/nav_utils.dart';

class PhonePincodePage extends StatefulWidget {
  final String phone;
  static const Duration resendCooldown = Duration(seconds: 5);

  const PhonePincodePage({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<PhonePincodePage> createState() => _PhonePincodePageState();
}

class _PhonePincodePageState extends State<PhonePincodePage> {
  final pinController = TextEditingController();
  late Timer countdownTimer;
  late Duration resendCooldown;
  bool enableResendButton = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Pinput(
              autofocus: true,
              controller: pinController,
              length: 6,
              onCompleted: (pin) async {
                //PhoneAuthProvider.credential(smsCode: pin, verificationId: verificationCode));
              },
            ),
            ElevatedButton(
              child: Text("Resend" +
                  (enableResendButton
                      ? ""
                      : " (${resendCooldown.inSeconds} seconds)")),
              onPressed: enableResendButton
                  ? null
                  : () {
                      // TODO resend code
                    },
            ),
          ],
        ),
      ),
    );
  }

  void startCountdown() {
    print("Countdown started");
    setState(() {
      resendCooldown = PhonePincodePage.resendCooldown;
      enableResendButton = false;
    });

    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    setState(() {
      final seconds = resendCooldown.inSeconds - 1;
      if (seconds < 0) {
        enableResendButton = true;
        countdownTimer.cancel();
      } else {
        resendCooldown = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    countdownTimer.cancel();
    super.dispose();
  }
}
