import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/detail_paket_data_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/detail_pulsa_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/rekomendasi_card.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/idr.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

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
                Consumer<PulsaProvider>(
                  builder: (context, provider, _) {
                    switch (provider.myState) {
                      case MyState.loading:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case MyState.loaded:
                        if (provider.recommended.isEmpty) {
                          return const Text('Maaf Belum Ada Rekomendasi');
                        } else {
                          return SizedBox(
                            child: ListView.builder(
                              itemCount: provider.recommended.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                return RekomendasiCard(
                                  image: provider.recommended[index].icon.url,
                                  title: provider.recommended[index].name,
                                  description:
                                      provider.recommended[index].description,
                                  price: FormatCurrency.convertToIdr(
                                      provider.recommended[index].price, 0),
                                  date:
                                      '${provider.recommended[index].credit.activePeriod} Hari',
                                  poin:
                                      '${provider.recommended[index].rewardPoints} Poin',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPulsaScreen(
                                          productId:
                                              provider.data!.data![index].id,
                                          id: index,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                      case MyState.failed:
                        return const Text('Ada Masalah');
                      default:
                        return const SizedBox();
                    }
                  },
                ),
                Consumer<PaketDataProvider>(
                  builder: (context, provider, _) {
                    switch (provider.myState) {
                      case MyState.loading:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case MyState.loaded:
                        if (provider.recommended.isEmpty) {
                          return const Text('Maaf Belum Ada Rekomendasi');
                        } else {
                          return SizedBox(
                            child: ListView.builder(
                              itemCount: provider.recommended.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                return RekomendasiCard(
                                  image: provider.recommended[index].icon.url,
                                  title: provider.recommended[index].name,
                                  description:
                                      provider.recommended[index].description,
                                  price: FormatCurrency.convertToIdr(
                                      provider.recommended[index].price, 0),
                                  date:
                                      '${provider.recommended[index].package.activePeriod} Hari',
                                  poin:
                                      '${provider.recommended[index].rewardPoints} Poin',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPaketDataScreen(
                                          productId:
                                              provider.data!.data![index].id,
                                          id: index,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                      case MyState.failed:
                        return const Text('Ada Masalah');
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
