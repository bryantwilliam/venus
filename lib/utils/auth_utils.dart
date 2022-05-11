import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venus/utils/nav_utils.dart';

// returns true if user doesn't exist in firebase or is incomplete
bool isUserIncomplete() {
// TODO signup incomplete could maybe be checked using user.providerData
  //or stored user data in database
  // or the below implementation...

  if (isUserSignedIn()) {
    User user = FirebaseAuth.instance.currentUser!;
    // TODO check if all the other necessary details filled in for the user
    return !hasPhoneLinked(user) || !user.emailVerified;
  }
  return true;
}

bool hasPhoneLinked(User user) {
  return user.phoneNumber != null;
}

bool hasEmailLinked(User user) {
  return user
      .emailVerified; //TODO or user.email == null. Check after facebook login is implemented
}

bool isUserSignedIn() {
  return FirebaseAuth.instance.currentUser != null;
}

// Returns null and signs out if there is no user. Should be used when trying to access the user in the main app.
User? tryGetCurrentUserOrSignout() {
  if (!isUserSignedIn()) {
    print(
        "Error: Tried to access user while not signed in, in a place that should only be accessed while signed in! Something is wrong, please contact the developer!!");
    FirebaseAuth.instance
        .signOut(); // NOTICE This is used to update the authStateChange stream in auth_gate.dart incase the user is no longer signed in but there has been no authStateChange update for some reason (this means there's a bug).
  }
  return FirebaseAuth.instance.currentUser;
}
