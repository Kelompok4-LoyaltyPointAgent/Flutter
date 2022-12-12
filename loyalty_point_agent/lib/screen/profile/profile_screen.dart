import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/profile/favorit_screen.dart';
import 'package:loyalty_point_agent/screen/profile/keamanan_screen.dart';
import 'package:loyalty_point_agent/screen/profile/pusat_bantuan_screen.dart';
import 'package:loyalty_point_agent/screen/profile/riwayat_transaksi_screen.dart';
import 'package:loyalty_point_agent/screen/profile/widget/logout_dialog.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () {
  //     Provider.of<UserProvider>(context, listen: false).fetchUsersData();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        title: Consumer<UserProvider>(
          builder: (context, provider, _) {
            switch (provider.myState) {
              case MyState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case MyState.loaded:
                if (provider.user == null) {
                  return const Text('Sorry, your data still empty');
                } else {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: yellowColor,
                        radius: 42,
                        child: CircleAvatar(
                          radius: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: const Image(
                              image: NetworkImage(
                                  "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/08/27/4195828089.jpg"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        provider.user!.name.toString(),
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: yellowColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            provider.user!.poin.toString(),
                            style: yellowTextStyle.copyWith(fontSize: 14),
                          )
                        ],
                      )
                    ],
                  );
                }
              case MyState.failed:
                return const Text('Oops, something went wrong!');
              default:
                return const SizedBox();
            }
          },
        ),
        centerTitle: true,
        toolbarHeight: 200,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Pengguna',
              style: navyTextStyle.copyWith(fontWeight: bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FavoritScreen(),
                  ),
                );
              },
              leading: Icon(
                Icons.favorite,
                color: yellowColor,
              ),
              title: Text(
                'Favorit',
                style: navyTextStyle,
              ),
              shape: Border(
                bottom: BorderSide(color: navyColor, width: 0.5),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RiwayatTransaksiScreen(),
                  ),
                );
              },
              leading: Icon(
                Icons.shopping_bag_sharp,
                color: yellowColor,
              ),
              title: Text(
                'Riwayat Transaksi',
                style: navyTextStyle,
              ),
              shape: Border(
                bottom: BorderSide(color: navyColor, width: 0.5),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const KeamananScreen(),
                  ),
                );
              },
              leading: Icon(
                Icons.lock_sharp,
                color: yellowColor,
              ),
              title: Text(
                'Keamanan',
                style: navyTextStyle,
              ),
              shape: Border(
                bottom: BorderSide(color: navyColor, width: 0.5),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Bantuan dan Informasi',
              style: navyTextStyle.copyWith(fontWeight: bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PusatBantuanScreen(),
                  ),
                );
              },
              leading: Icon(
                Icons.favorite,
                color: yellowColor,
              ),
              title: Text(
                'Pusat Bantuan',
                style: navyTextStyle,
              ),
              shape: Border(
                bottom: BorderSide(color: navyColor, width: 0.5),
              ),
            ),
            ListTile(
              onTap: () async {
                Uri url = Uri.parse('https://wa.me/081391227795');
                // Uri url = Uri.parse('https://youtube.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $url';
                }
              },
              leading: Icon(
                Icons.headphones,
                color: yellowColor,
              ),
              title: Text(
                'Hubungi Kami',
                style: navyTextStyle,
              ),
              shape: Border(
                bottom: BorderSide(color: navyColor, width: 0.5),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                          bottom: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: navyColor,
                      content: const SingleChildScrollView(
                        child: LogoutDialog(),
                      ),
                    ),
                  ),
                );
              },
              leading: Icon(
                Icons.logout,
                color: yellowColor,
              ),
              title: Text(
                'Keluar',
                style: navyTextStyle,
              ),
              shape: Border(
                bottom: BorderSide(color: navyColor, width: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
