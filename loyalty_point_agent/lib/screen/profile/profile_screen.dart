import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/login_provider.dart';
import 'package:loyalty_point_agent/screen/login/login.dart';
import 'package:loyalty_point_agent/screen/profile/favorit_screen.dart';
import 'package:loyalty_point_agent/screen/profile/keamanan_screen.dart';
import 'package:loyalty_point_agent/screen/profile/pusat_bantuan_screen.dart';
import 'package:loyalty_point_agent/screen/profile/riwayat_transaksi_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final deleteToken = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Column(
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
              'Namikaze Minato',
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
                  '9999999999999999999999999',
                  style: yellowTextStyle.copyWith(fontSize: 14),
                )
              ],
            )
          ],
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
                // Uri url = Uri.parse('https://wa.me/628139122779');
                Uri url = Uri.parse('https://youtube.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
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
                deleteToken.deleteToken();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
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
