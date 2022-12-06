import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/navbar/navbar.dart';
import 'package:loyalty_point_agent/screen/onboarding/onboarding_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        prefs.getString('token') != null
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavBarScreen(),
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardingScreen(),
                ),
              );
      },
    );
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Image.asset(
          'assets/logo_utama.png',
          height: 69,
          width: 69,
        ),
      ),
    );
  }
}
