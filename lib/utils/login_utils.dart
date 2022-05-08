import 'package:flutter/material.dart';
import 'package:venus/utils/firebase_auth_utils.dart';

void _popToFirst(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}

void loginOrNextSignupPage(BuildContext context, Widget nextSignupPage) {
  // check if already has acc, if so go to the next signup part,
  // otherwise login by popping all login pages.
  if (isSignupPartial()) {
    Navigator.push(
        context, MaterialPageRoute<void>(builder: (_) => nextSignupPage));
  } else {
    _popToFirst(context);
  }
}
