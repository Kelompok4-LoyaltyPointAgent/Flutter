import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/home_provider.dart';
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
    NavBarProvider navBarProvider = Provider.of<NavBarProvider>(context);
    int currentScreenIndex = navBarProvider.fetchCurrentScreenIndex;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: yellowColor,
        unselectedItemColor: nabBarColorUnselected,
        selectedItemColor: navbarColorSelected,
        elevation: 1.5,
        currentIndex: currentScreenIndex,
        showUnselectedLabels: true,
        onTap: (value) => navBarProvider.updateScreenIndex(value),
        items: [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Poin',
            icon: Icon(Icons.star),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: screens[currentScreenIndex],
    );
  }
}
