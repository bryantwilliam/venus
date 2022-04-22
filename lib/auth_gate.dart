import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venus/pages/signin_page.dart';
import 'package:venus/root_nav_fluid.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Show error message dialog"); // TODO
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
              "splash or loading screen that says it's waiting to connect?"); // TODO
        } else if (!snapshot.hasData) {
          return const SignInPage();
        } else {
          User user = snapshot.data!;
          print("user: " + user.toString());
          return RootNavigationFluid(user);
        }
      },
    );
  }
}
