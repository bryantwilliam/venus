import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:venus/pages/swipe_page.dart';
import 'package:venus/root_nav_fluid.dart';

import 'models/match_option.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red,
        brightness: Brightness.dark,
        primary: Colors.white,
        secondary: Colors.red,
        background: Colors.red,
        tertiary: Colors.redAccent,
        shadow: Colors.black.withOpacity(0.5),
      ),
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //systemNavigationBarColor: Colors.black,
      statusBarColor: themeData.colorScheme.background,
    ));

    return MaterialApp(
      title: 'Venus',
      theme: themeData,
      home: SafeArea(
        child: RootNavigationFluid(),
      ),
      //home: const SwipePage(),
    );
  }
}
