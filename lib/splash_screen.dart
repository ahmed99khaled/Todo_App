import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/settings_provider.dart';
import 'package:todo/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'Splash Screen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Image.asset(
      provider.currentTheme == ThemeMode.light
          ? 'assets/images/splash_light.png'
          : 'assets/images/splash_dark.png',
      fit: BoxFit.fill,
    );
  }
}
