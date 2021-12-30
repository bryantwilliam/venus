import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:venus/pages/swipe_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.redAccent,
      statusBarColor: Colors.redAccent,
    ));
    return MaterialApp(
        title: 'Venus',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const SwipePage());
  }
}
