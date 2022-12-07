import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/detail_paket_data_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/detail_pulsa_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/rekomendasi_card.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
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
                        if (provider.data == null) {
                          return const Text('Sorry, your data still empty');
                        } else {
                          return SizedBox(
                            child: ListView.builder(
                              itemCount: provider.data!.data!.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                return RekomendasiCard(
                                  image: 'assets/provider_telkomsel.png',
                                  title: provider.data!.data![index].name,
                                  description:
                                      'Teleponan 185 menit sesama telkomsel dan 15 menit ke operator lain',
                                  price:
                                      'Rp. ${provider.data!.data![index].price.toString()}',
                                  date:
                                      '${provider.data!.data![index].credit.activePeriod} Hari',
                                  poin:
                                      '${provider.data!.data![index].pricePoints} Poin',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPulsaScreen(
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
                        if (provider.data == null) {
                          return const Text('Sorry, your data still empty');
                        } else {
                          return SizedBox(
                            child: ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                return RekomendasiCard(
                                  image: 'assets/provider_telkomsel.png',
                                  title: provider.data!.data![index].name,
                                  description: provider
                                      .data!.data![index].package.description,
                                  price:
                                      'Rp. ${provider.data!.data![index].price.toString()}',
                                  date:
                                      '${provider.data!.data![index].package.activePeriod} Hari',
                                  poin:
                                      '${provider.data!.data![index].pricePoints} Poin',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPaketDataScreen(
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
