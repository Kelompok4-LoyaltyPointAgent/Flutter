import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/navbar_provider.dart';
import 'package:loyalty_point_agent/screen/home/beranda_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_screen.dart';
import 'package:loyalty_point_agent/screen/profile/profile_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatefulWidget {
  final int pageIndex;
  const NavBarScreen({Key? key, this.pageIndex = 0}) : super(key: key);

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
  void initState() {
    context.read<NavBarProvider>().screenIndex = widget.pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: navyColor,
            unselectedItemColor: greyColor,
            selectedItemColor: yellowColor,
            elevation: 1.5,
            currentIndex: provider.screenIndex,
            showUnselectedLabels: true,
            onTap: (value) => provider.updateScreenIndex(value),
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
          body: screens[provider.screenIndex],
        );
      },
    );
  }
}
