import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

bool isUserAccountSetup(User user) {
  return user.email != null && user.phoneNumber != null;
  // TODO check for user.displayName != null && gender, age or other mandatory details.
}

Future<void> logout() async {
  await FacebookAuth.instance.logOut();
  await FirebaseAuth.instance.signOut();
}
