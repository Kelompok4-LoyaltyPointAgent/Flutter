import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_paketdata_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_pulsa_screen.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/card_rekomendasi_poin.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

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
                                return CardRekomedasiPoin(
                                  imageProvider:
                                      provider.data!.data![index].icon.url,
                                  image: provider
                                      .data!.data![index].productPicture.url,
                                  voucher: provider.data!.data![index].price
                                      .toString(),
                                  provider:
                                      provider.data!.data![index].provider,
                                  title: provider.data!.data![index].name,
                                  deskripsi:
                                      'Tukarkan poin Anda untuk mendapatkan pulsa ${provider.data!.data![index].price}',
                                  poin:
                                      '${provider.data!.data![index].pricePoints} Poin',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PoinDetailPulsaScreen(
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
                              itemCount: provider.data!.data!.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                return CardRekomedasiPoin(
                                  imageProvider:
                                      provider.data!.data![index].icon.url,
                                  image: provider
                                      .data!.data![index].productPicture.url,
                                  voucher:
                                      '${provider.data!.data![index].package.totalInternet} GB',
                                  provider:
                                      provider.data!.data![index].provider,
                                  title: provider.data!.data![index].name,
                                  deskripsi:
                                      provider.data!.data![index].description,
                                  poin:
                                      '${provider.data!.data![index].pricePoints} Poin',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PoinDetailPaketDataScreen(
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
