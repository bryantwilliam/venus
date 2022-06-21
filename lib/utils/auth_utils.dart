import 'package:firebase_auth/firebase_auth.dart';

bool isUserAccountSetup(User user) {
  return user.email != null && user.phoneNumber != null;
  // TODO check for user.displayName != null && gender, age or other mandatory details.
}
