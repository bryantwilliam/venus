import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/auth_utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO
    return Container(
      child: Center(
        child: Column(
          children: [
            Text("Profile Page"),
            Text("FirebaseAuth.instance.currentUser.toString() -----" +
                FirebaseAuth.instance.currentUser.toString()),
            Text(""),
            ElevatedButton(
              child: Text("Sign out"),
              onPressed: () async {
                await logout();
              },
            ),
            Text(""),
            Text(""),
          ],
        ),
      ),
    );
  }
}
