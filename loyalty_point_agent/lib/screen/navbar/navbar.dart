import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/navbar_provider.dart';
import 'package:loyalty_point_agent/screen/home/beranda_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_screen.dart';
import 'package:loyalty_point_agent/screen/profile/profile_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  List<dynamic> screens = [
    const BerandaScreen(),
    const PoinScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    NavBarProvider navBarProvider = Provider.of<NavBarProvider>(context);
    int currentScreenIndex = navBarProvider.fetchCurrentScreenIndex;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: navyColor,
        unselectedItemColor: greyColor,
        selectedItemColor: yellowColor,
        elevation: 1.5,
        currentIndex: currentScreenIndex,
        showUnselectedLabels: true,
        onTap: (value) => navBarProvider.updateScreenIndex(value),
        items: const [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Poin',
            icon: Icon(
              Icons.star,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            icon: Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ],
      ),
      body: Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (_) => screens.elementAt(currentScreenIndex));
        },
      ),
    );
  }
}
