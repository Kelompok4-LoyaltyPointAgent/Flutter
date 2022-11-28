import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/poin/poin_penukaran_screen.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/poin_rekomendasi_card.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
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
            //flex: 9,
            //height: MediaQuery.of(context).size.height, //height of TabBarView
            child: TabBarView(
              children: <Widget>[
                Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return PoinRekomendasiCard(
                        provider: 'Telkomesel',
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
                              builder: (context) => const PoinPenukaranScreen(),
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
                      return PoinRekomendasiCard(
                        provider: 'Telkomesel',
                        image: 'assets/poin_rekomendasi_paketdata.png',
                        title: 'Halo Nonstop 4 GB ',
                        deskripsi:
                            'Hadir untuk Anda memberikan intenet sepuasnya dalam 24 Jam',
                        poin: '2500 poin',
                        imageProvider: 'assets/telkomsel.png',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PoinPenukaranScreen(),
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
