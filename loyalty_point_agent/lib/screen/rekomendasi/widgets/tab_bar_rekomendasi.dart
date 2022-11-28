import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/rekomendasi_pemesanan_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/rekomendasi_card.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class TabBarRekomendasi extends StatefulWidget {
  const TabBarRekomendasi({super.key});

  @override
  State<TabBarRekomendasi> createState() => _TabBarRekomendasiState();
}

class _TabBarRekomendasiState extends State<TabBarRekomendasi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // length of tabs
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TabBar(
            indicatorColor: yellowColor,
            tabs: [
              Tab(
                child: Text(
                  'Pulsa',
                  style: navyTextStyle.copyWith(fontWeight: semiBold),
                ),
              ),
              Tab(
                child: Text(
                  'Paket Data',
                  style: navyTextStyle.copyWith(fontWeight: semiBold),
                ),
              ),
            ],
          ),
          Expanded(
            //height: 530, //height of TabBarView
            child: TabBarView(
              children: <Widget>[
                Center(
                  child: ListView.builder(
                    itemCount: 6,
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
                ),
                Center(
                  child: ListView.builder(
                    itemCount: 6,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
