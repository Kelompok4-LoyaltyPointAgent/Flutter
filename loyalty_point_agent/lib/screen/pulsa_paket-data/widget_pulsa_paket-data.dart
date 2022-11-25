import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/pulsa_paket-data/detail_pemesanan.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class WidgetPulsaPaketData extends StatefulWidget {
  const WidgetPulsaPaketData({super.key});

  @override
  State<WidgetPulsaPaketData> createState() => _WidgetPulsaPaketDataState();
}

class _WidgetPulsaPaketDataState extends State<WidgetPulsaPaketData> {
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
          SizedBox(
            height: 400, //height of TabBarView
            child: TabBarView(
              children: <Widget>[
                Center(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: grayishColor,
                          child: ListTile(
                            title: Text(
                              'Pulsa Rp 5.000',
                              style: navyTextStyle.copyWith(fontWeight: bold),
                            ),
                            subtitle: Row(
                              children: [
                                const Text('30 hari'),
                                const Text(' | '),
                                Icon(
                                  Icons.star,
                                  color: yellowColor,
                                  size: 15,
                                ),
                                const Text('550 Poin'),
                              ],
                            ),
                            trailing: Text(
                              'Rp. 5.500',
                              style: yellowTextStyle.copyWith(
                                  fontWeight: bold, fontSize: 18),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailPemesananScreen(),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                ),
                Center(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: grayishColor,
                          child: ListTile(
                            title: Text(
                              'Si Paling SAKTI',
                              style: navyTextStyle.copyWith(fontWeight: bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '58 GB',
                                  style:
                                      gbTextStyle.copyWith(fontWeight: medium),
                                ),
                                Row(
                                  children: [
                                    const Text('30 hari'),
                                    const Text(' | '),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 15,
                                    ),
                                    const Text('14500 Poin'),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Text(
                              'Rp. 145.500',
                              style: yellowTextStyle.copyWith(
                                  fontWeight: bold, fontSize: 18),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
