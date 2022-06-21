import 'package:flutter/material.dart';

Future<void> pushNextPage(BuildContext context, Widget nextPage,
    {bool pushReplace = false}) async {
  if (pushReplace) {
    await Navigator.pushReplacement(
        context, MaterialPageRoute<void>(builder: (_) => nextPage));
  } else {
    await Navigator.push(
        context, MaterialPageRoute<void>(builder: (_) => nextPage));
  }
}
