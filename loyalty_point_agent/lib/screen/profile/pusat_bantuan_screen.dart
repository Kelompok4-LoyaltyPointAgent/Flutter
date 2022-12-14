import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/faq_provider.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/card_menu.dart';
import 'package:loyalty_point_agent/screen/profile/hola/hola_kuota_screen.dart';
import 'package:loyalty_point_agent/screen/profile/hola/hola_layanan_screen.dart';
import 'package:loyalty_point_agent/screen/profile/hola/hola_poin_screen.dart';
import 'package:loyalty_point_agent/screen/profile/hola/hola_pulsa_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class PusatBantuanScreen extends StatefulWidget {
  const PusatBantuanScreen({super.key});

  @override
  State<PusatBantuanScreen> createState() => _PusatBantuanScreenState();
}

class _PusatBantuanScreenState extends State<PusatBantuanScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<FaqProvider>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Pusat Bantuan',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Bantuan berdasarkan topik',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 10,
                      ),
                      // height: 124,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/background_card.png',
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HolaPulsaScreen(),
                                    ),
                                  );
                                },
                                child: const CardMenu(
                                  image: 'assets/pulsa.png',
                                  title: 'Pulsa',
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HolaKuotaScreen(),
                                    ),
                                  );
                                },
                                child: const CardMenu(
                                  image: 'assets/paket_data.png',
                                  title: 'Paket Data',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HolaPoinScreen(),
                                    ),
                                  );
                                },
                                child: const CardMenu(
                                  image: 'assets/hola_poin.png',
                                  title: 'Hola Poin',
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HolaLayananScreen(),
                                    ),
                                  );
                                },
                                child: const CardMenu(
                                  image: 'assets/layanan.png',
                                  title: 'Layanan',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hola Pulsa',
                    style: yellowTextStyle.copyWith(
                        fontSize: 24, fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Kata sandi digunakan\n untuk masuk ke akun anda',
                    style: navyTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<FaqProvider>(
                    builder: (context, provider, _) {
                      return ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: yellowColor,
                            child: ExpansionTile(
                              // key: expansionTileKey,
                              title: Text(
                                provider.pusatBantuan[index].question,
                                style: navyTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                              children: [
                                ListTile(
                                  tileColor: whiteColor,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          provider.pusatBantuan[index].answer,
                                          style: blackRegulerTextStyle,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
