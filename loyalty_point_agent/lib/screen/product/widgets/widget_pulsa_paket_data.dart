import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/screen/product/detail_pemesanan.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WidgetPulsaPaketData extends StatefulWidget {
  const WidgetPulsaPaketData({super.key});

  @override
  State<WidgetPulsaPaketData> createState() => _WidgetPulsaPaketDataState();
}

class _WidgetPulsaPaketDataState extends State<WidgetPulsaPaketData> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        Provider.of<PaketDataProvider>(context, listen: false).fetchPaketData();
      },
    );
  }

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
            height: 60.h,
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
                  child: Consumer<PaketDataProvider>(
                    builder: (context, provider, index) {
                      switch (provider.myState) {
                        case MyState.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case MyState.loaded:
                          if (provider.data == null) {
                            return const Text('Sorry, your data still empty');
                          } else {
                            return ListView.builder(
                                itemCount: provider.data!.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    color: grayishColor,
                                    child: ListTile(
                                      title: Text(
                                        provider.data!.data![index].name,
                                        style: navyTextStyle.copyWith(
                                            fontWeight: bold),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${provider.data!.data![index].package.totalInternet} GB',
                                            style: gbTextStyle.copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 12),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  '${provider.data!.data![index].package.activePeriod} Hari'),
                                              const Text(' | '),
                                              Icon(
                                                Icons.star,
                                                color: yellowColor,
                                                size: 15,
                                              ),
                                              Text(
                                                  '${provider.data!.data![index].rewardPoints} Poin'),
                                            ],
                                          ),
                                        ],
                                      ),
                                      trailing: Text(
                                        'Rp. ${provider.data!.data![index].price}',
                                        style: yellowTextStyle.copyWith(
                                            fontWeight: bold, fontSize: 16),
                                      ),
                                    ),
                                  );
                                });
                          }
                        case MyState.failed:
                          return const Text('Ada Masalah');
                        default:
                          return const SizedBox();
                      }
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
