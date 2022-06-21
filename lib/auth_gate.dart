import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venus/pages/sign_up/login_page.dart';
import 'package:venus/root_nav_fluid.dart';
import 'package:venus/utils/auth_utils.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // TODO consider using FutureBuilder if bug still continues
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Show error message popup that can't be exited" +
              snapshot.error.toString()); // TODO
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
              "splash or loading screen that says it's waiting to connect?"); // TODO
        } else if (snapshot.hasData) {
          User user = snapshot.data!;
          if (isUserAccountSetup(user)) {
            return const RootNavigationFluid();
          }
          // TODO remove this
          print("debug auth gate: User account is not setup");
        }
        return const LoginPage();
      },
    );
  }
}
