import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailSignupPage extends StatelessWidget {
  const EmailSignupPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
            ),
            ElevatedButton(
              child: Text("Next"),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
