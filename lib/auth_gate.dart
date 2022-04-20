import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:venus/root_nav_fluid.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: [
              PhoneProviderConfiguration(),
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                clientId: '...',
              ),
              FacebookProviderConfiguration(
                clientId: '...',
              )
            ],
          );
        }

        return RootNavigationFluid();
      },
    );
  }
}
