import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:venus/pages/likes_page.dart';
import 'package:venus/pages/messages_page.dart';
import 'package:venus/pages/profile_page.dart';
import 'package:venus/pages/swipe_page.dart';

class RootNavigationFluid extends StatefulWidget {
  @override
  _RootNavigationState createState() => _RootNavigationState();
}

class _RootNavigationState extends State {
  Widget? _child;

  @override
  void initState() {
    _child = SwipePage();
    super.initState();
  }

  @override
  Widget build(context) {
    // Build a simple container that switches content based of off the selected navigation item
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: _child,
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                icon: Icons.message,
                backgroundColor: Color(0xFFFCBA02),
                extras: {"label": "Messages"}),
            FluidNavBarIcon(
                icon: Icons.explore,
                backgroundColor: Color(0xFF4285F4),
                extras: {"label": "Swipe"}),
            FluidNavBarIcon(
                icon: Icons.person,
                backgroundColor: Color(0xFF34A950),
                extras: {"label": "Profile"}),
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
          scaleFactor: 1.5,
          defaultIndex: 1,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!["label"],
            child: item,
          ),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = MessagesPage();
          break;
        case 1:
          _child = SwipePage();
          break;
        case 2:
          _child = ProfilePage();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
