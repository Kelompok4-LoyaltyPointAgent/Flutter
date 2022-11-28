import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/checkbox_provider.dart';
import 'package:loyalty_point_agent/providers/navbar_provider.dart';
import 'package:loyalty_point_agent/providers/onboarding_provider.dart';
import 'package:loyalty_point_agent/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckboxProvider(),
        ),
      ],
      // child: const MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   home: SplashScreen(),
      // ),
      child: Sizer(builder: (context, orientation, deviceType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      }),
    );
  }
}
