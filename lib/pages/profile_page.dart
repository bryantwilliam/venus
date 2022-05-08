import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final User _user;
  const ProfilePage(this._user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text("Profile Page"),
            Text("_user.toString() -----" + _user.toString()),
            Text(""),
            ElevatedButton(
              child: Text("Sign out"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
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
