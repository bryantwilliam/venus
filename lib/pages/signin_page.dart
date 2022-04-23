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
          Text("Sign in page"),
          ElevatedButton(
            onPressed: () {},
            child: Text("Login with email"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Login with Facebook"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Login with Google"),
          ),
          if (Platform.isIOS)
            ElevatedButton(
              onPressed: () {},
              child: Text("Login with Apple"),
            ),
        ],
      ),
    );
  }
}
