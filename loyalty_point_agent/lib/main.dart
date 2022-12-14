import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/checkbox_provider.dart';
import 'package:loyalty_point_agent/providers/faq_provider.dart';
import 'package:loyalty_point_agent/providers/favorite_provider.dart';
import 'package:loyalty_point_agent/providers/feedbacks_provider.dart';
import 'package:loyalty_point_agent/providers/history_provider.dart';
import 'package:loyalty_point_agent/providers/login_provider.dart';
import 'package:loyalty_point_agent/providers/navbar_provider.dart';
import 'package:loyalty_point_agent/providers/onboarding_provider.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/register_provider.dart';
import 'package:loyalty_point_agent/providers/selected_method_provider.dart';
import 'package:loyalty_point_agent/providers/transaction_provider.dart';
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
        ChangeNotifierProvider(
          create: (context) => PulsaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckboxProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectedMethodProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedbacksProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FaqProvider(),
        ),
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
