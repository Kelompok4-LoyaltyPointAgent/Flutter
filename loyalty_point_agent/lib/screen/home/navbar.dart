import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/home_provider.dart';
import 'package:loyalty_point_agent/screen/home/beranda_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_screen.dart';
import 'package:loyalty_point_agent/screen/profile/profile_screen.dart';
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
    NavBarProvider navBarProvider = Provider.of<NavBarProvider>(context);
    int currentScreenIndex = navBarProvider.fetchCurrentScreenIndex;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        elevation: 1.5,
        currentIndex: currentScreenIndex,
        showUnselectedLabels: true,
        onTap: (value) => navBarProvider.updateScreenIndex(value),
        items: [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: Icon(
                (currentScreenIndex == 0) ? Icons.home : Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Poin',
            icon: Icon((currentScreenIndex == 1)
                ? Icons.star
                : Icons.star_border_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            icon: Icon((currentScreenIndex == 2)
                ? Icons.event_available
                : Icons.event_available_outlined),
          ),
        ],
      ),
      body: screens[currentScreenIndex],
    );
  }
}
