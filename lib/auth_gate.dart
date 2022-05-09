import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venus/pages/sign_up/login_page.dart';
import 'package:venus/root_nav_fluid.dart';
import 'package:venus/utils/auth_utils.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<User?>(
      // TODO consider using FutureBuilder if bug still continues
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Show error message popup that can't be exited" +
              snapshot.error.toString()); // TODO
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
              "splash or loading screen that says it's waiting to connect?"); // TODO
        } else if (snapshot.hasData) {
          User user = snapshot.data!;

          if (isUserIncomplete()) {
            // TODO delete the user in firebase auth and firestore (if they are there) because user's data is broken
            return LoginPage();
          }
          return RootNavigationFluid();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
