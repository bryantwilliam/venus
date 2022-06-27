import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:venus/pages/sign_up/phone_signup_page.dart';
import 'package:venus/utils/nav_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // TODO change this later to be a asset image.
          CachedNetworkImage(
            imageUrl:
                "https://cdn.britannica.com/92/6792-004-C757C6D7/The-Birth-of-Venus-canvas-Sandro-Botticelli.jpg",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  pushNextPage(context, PhoneSignUpPage());
                },
                child: Text("Sign in with phone number"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _signInWithFacebook();
                  // TODO check for error messages to display to user. If there are errors, just return; (facebook login failed, so do nothing)
                  pushNextPage(context, PhoneSignUpPage());
                },
                child: Text("Sign in with Facebook"),
              ),
            ],
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
