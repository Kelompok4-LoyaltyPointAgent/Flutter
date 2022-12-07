import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/login_provider.dart';
import 'package:loyalty_point_agent/providers/navbar_provider.dart';
import 'package:loyalty_point_agent/providers/onboarding_provider.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/register_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/splash/splash_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
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
<<<<<<< HEAD
=======
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaketDataProvider(),
        ),
>>>>>>> a8a108467fd11ad965d4aa3e5a3987ea5cffcd14
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: yellowColor),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      }),
    );
  }
}
