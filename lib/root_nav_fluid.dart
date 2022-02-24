import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
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
  Widget build(context) {
    _child ??= SwipePage();
    // Build a simple container that switches content based of off the selected navigation item
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _child,
      bottomNavigationBar: FluidNavBar(
        animationFactor: 1,
        icons: [
          FluidNavBarIcon(icon: Icons.message, extras: {"label": "Messages"}),
          FluidNavBarIcon(icon: Icons.explore, extras: {"label": "Swipe"}),
          FluidNavBarIcon(icon: Icons.person, extras: {"label": "Profile"}),
        ],
        onChange: _handleNavigationChange,
        style: FluidNavBarStyle(
          barBackgroundColor: Colors.white,
          iconUnselectedForegroundColor: Colors.white,
          iconSelectedForegroundColor: Colors.black,
          iconBackgroundColor: Colors.red,
        ),
        scaleFactor: 1.5,
        defaultIndex: 1,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    Vibrate.feedback(FeedbackType.light);
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
        duration: Duration(milliseconds: 600),
        child: _child,
      );
    });
  }
}
