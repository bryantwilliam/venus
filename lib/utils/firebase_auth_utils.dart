import 'package:firebase_auth/firebase_auth.dart';

bool isSignupPartial() {
// TODO signup incomplete could maybe be checked using user.providerData
  //or stored user data in database
  // or the below implementation...

  if (FirebaseAuth.instance.currentUser != null) {
    User user = FirebaseAuth.instance.currentUser!;
    // TODO check if all the other necessary details filled in for the user
    return user.phoneNumber != null && user.email != null;
  }
  return true;
}
