import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:venus/pages/messages_page.dart';
import 'package:venus/pages/profile_page.dart';
import 'package:venus/pages/swipe_page.dart';

class RootNavigationFluid extends StatefulWidget {
  final User _user;
  const RootNavigationFluid(this._user, {Key? key}) : super(key: key);

  @override
  State<RootNavigationFluid> createState() => _RootNavigationFluidState();
}

class _RootNavigationFluidState extends State<RootNavigationFluid> {
  Widget? _child;

  @override
  Widget build(context) {
    _child ??= const SwipePage();
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
          barBackgroundColor: Theme.of(context).colorScheme.primary,
          iconUnselectedForegroundColor: Theme.of(context).colorScheme.primary,
          iconSelectedForegroundColor: Theme.of(context).colorScheme.primary,
          iconBackgroundColor: Theme.of(context).colorScheme.secondary,
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
          _child = const MessagesPage();
          break;
        case 1:
          _child = const SwipePage();
          break;
        case 2:
          _child = ProfilePage(widget._user);
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 600),
        child: _child,
      );
    });
  }
}
