import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:venus/pages/swipe_page.dart';
import 'package:venus/root_nav.dart';
import 'package:venus/root_nav_fluid.dart';
import 'package:venus/root_nav_google.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.red,
    ));
    return MaterialApp(
      title: 'Venus',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RootNavigationGoogle(),
      //home: const SwipePage(),
    );
  }
}
