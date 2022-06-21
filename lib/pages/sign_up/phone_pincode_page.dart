import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

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
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Pinput(
              autofocus: true,
              controller: _pinController,
              length: 6,
              onCompleted: (pin) async {
                // TODO
              },
            ),
            ElevatedButton(
              onPressed: () {
                // TODO resend
              },
              child: Text("Resend"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}
