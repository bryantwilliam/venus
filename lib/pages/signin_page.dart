import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Sign in with phone number"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Sign in with Facebook"),
          ),
        ],
      ),
    );
  }
}
