import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/poin/poin_penukaran_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_rekomendasi.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/card_menu.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/card_rekomendasi_poin.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class PoinScreen extends StatelessWidget {
  const PoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: grayishColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai, Kartika Noviyanti!',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: yellowColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '1000',
                  style: yellowTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ],
            )
          ],
        ),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              size: 30,
              color: navyColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: navyColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.symmetric(
                  horizontal: 47,
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
                child: Wrap(
                  spacing: 80,
                  runSpacing: 20,
                  children: const [
                    CardMenu(
                      image: 'assets/pulsa.png',
                      title: 'Pulsa',
                    ),
                    CardMenu(
                      image: 'assets/paket_data.png',
                      title: 'Paket Data',
                    ),
                    CardMenu(
                      image: 'assets/tarik_tunai.png',
                      title: 'Tarik Tunai',
                    ),
                    CardMenu(
                      image: 'assets/dompet_elektronik.png',
                      title: 'E-Wallet',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 10,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pulsa',
                        style: navyTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PoinRekomendasiScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Lihat Semua',
                          style: yellowTextStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return CardRekomedasiPoin(
                          provider: 'Telkomsel',
                          image: 'assets/poin_rekomendasi.png',
                          title: 'Halo Pulsa 50.000',
                          deskripsi:
                              'Tukarkan poin Anda untuk mendapatkan pulsa 50.000',
                          poin: '2500 poin',
                          imageProvider: 'assets/telkomsel.png',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PoinPenukaranScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paket Data',
                        style: navyTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PoinRekomendasiScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Lihat Semua',
                          style: yellowTextStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return CardRekomedasiPoin(
                          provider: 'Telkomsel',
                          image: 'assets/poin_rekomendasi.png',
                          title: 'Halo Nonstop 4 GB ',
                          deskripsi:
                              'Hadir untuk Anda memberikan intenet sepuasnya dalam 24 Jam',
                          poin: '2500 poin',
                          imageProvider: 'assets/telkomsel.png',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PoinPenukaranScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
