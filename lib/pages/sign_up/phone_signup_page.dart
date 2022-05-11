import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'phone_verification_page.dart';

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
              child: const Text("Next"),
              onPressed: validPhoneNumber
                  ? () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (_) => PhoneVerificationPage(
                                  isFacebookSignup: widget.isFacebookSignup,
                                  phone:
                                      countryDigits + _phoneController.text)));
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
