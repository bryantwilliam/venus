import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:venus/firebase_options.dart';
import 'package:venus/pages/swipe_page.dart';
import 'package:venus/root_nav_fluid.dart';

import 'auth_gate.dart';
import 'models/match_option.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

    // NOTICE https://firebase.flutter.dev/docs/analytics/get-started/
    // TODO add analytics of each part of the app
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    return MaterialApp(
      title: 'Venus',
      theme: themeData,
      home: SafeArea(
        child: AuthGate(),
      ),
      navigatorObservers: [
        // NOTICE https://stackoverflow.com/a/64773363/3109055
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      //home: const SwipePage(),
    );
  }
}
