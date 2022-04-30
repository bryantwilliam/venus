import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venus/pages/sign_up/phone_signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (ctx) => SignUpPage()));
            },
            child: Text("Sign in with phone number"),
          ),
          ElevatedButton(
            onPressed: () {
              // Login with facebook
              // Give facebook info to the signuppage.
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (_) => SignUpPage()));
            },
            child: Text("Sign in with Facebook"),
          ),
        ],
      ),
    );
  }
}
