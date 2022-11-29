import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/rekomendasi_pemesanan_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/rekomendasi_card.dart';
import 'package:loyalty_point_agent/screen/product/pulsa_paket-data_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/rekomendasi_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai, Kartika Noviyanti!',
              style: navyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: yellowColor,
                  size: 24,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '1000 poin',
                  style: yellowTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
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
              color: yellowColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.info_outline,
              size: 30,
              color: yellowColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PulsaPaketDataScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/pulsa.png',
                            height: 90,
                            width: 90,
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Text(
                            'Pulsa',
                            style: navyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PulsaPaketDataScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/paket_data.png',
                            height: 90,
                            width: 90,
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Text(
                            'Paket Data',
                            style: navyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Rekomendasi Untukmu',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
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
                                      const RekomendasiScreen(),
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
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      primary: false,
                      itemBuilder: (BuildContext context, int index) {
                        return RekomendasiCard(
                          image: 'assets/provider_telkomsel.png',
                          title: 'Kring-kring',
                          description:
                              'Teleponan 185 menit sesama telkomsel dan 15 menit ke operator lain',
                          price: 'Rp. 50.000',
                          date: '30 Hari',
                          poin: '5000 Poin',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RekomendasiPemesananScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
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
                                      const RekomendasiScreen(),
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
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      primary: false,
                      itemBuilder: (BuildContext context, int index) {
                        return RekomendasiCard(
                          image: 'assets/provider_telkomsel.png',
                          title: 'Kring-kring',
                          description:
                              'Teleponan 185 menit sesama telkomsel dan 15 menit ke operator lain',
                          price: 'Rp. 50.000',
                          date: '30 Hari',
                          poin: '5000 Poin',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RekomendasiPemesananScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
