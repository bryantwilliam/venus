import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venus/pages/login_page.dart';
import 'package:venus/root_nav_fluid.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
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

          // TODO remove debug prints
          print("user 1: " + user.toString());
          print("current user 1: " +
              FirebaseAuth.instance.currentUser.toString());
          user.reload();
          print("user 2: " + user.toString());
          print("current user 2: " +
              FirebaseAuth.instance.currentUser.toString());

          // TODO
          // if (if user deleted in firebase || signup incomplete*/) {
          //     delete the user
          //     return LoginPage();
          // }
          return RootNavigationFluid(user);
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
