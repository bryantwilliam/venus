import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:venus/pages/sign_up/phone_signup_page.dart';
import 'package:venus/utils/nav_utils.dart';

import '../../utils/auth_utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              pushNextPage(context, PhoneSignUpPage(), false);
            },
            child: Text("Sign in with phone number"),
          ),
          ElevatedButton(
            onPressed: () async {
              await _signInWithFacebook();
              loginOrNextSignupPage(context, PhoneSignUpPage(), false);
            },
            child: Text("Sign in with Facebook"),
          ),
        ],
      ),
    );
  }

  Future<UserCredential?> _signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
    return null;
  }
}
