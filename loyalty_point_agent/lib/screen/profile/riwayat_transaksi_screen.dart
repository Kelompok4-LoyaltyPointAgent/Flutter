import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/history_provider.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class RiwayatTransaksiScreen extends StatefulWidget {
  const RiwayatTransaksiScreen({super.key});

  @override
  State<RiwayatTransaksiScreen> createState() => _RiwayatTransaksiScreenState();
}

class _RiwayatTransaksiScreenState extends State<RiwayatTransaksiScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<HistoryProvider>(context, listen: false).fetchHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Riwayat',
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
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TabBar(
              indicatorColor: yellowColor,
              tabs: [
                Tab(
                  child: Text(
                    'Pembelian',
                    style: navyTextStyle.copyWith(fontWeight: semiBold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Penukaran',
                    style: navyTextStyle.copyWith(fontWeight: semiBold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Consumer<HistoryProvider>(
                    builder: (context, provider, _) {
                      switch (provider.myState) {
                        case MyState.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case MyState.loaded:
                          if (provider.data == null) {
                            return const Text('Belum Ada Data');
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Center(
                                child: ListView.builder(
                                    itemCount: provider.data!.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        elevation: 2,
                                        color: whiteColor,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    provider.data!.data![index]
                                                        .product!.provider
                                                        .toString(),
                                                    style: dangerTextStyle
                                                        .copyWith(
                                                      fontSize: 12,
                                                      fontWeight: medium,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${provider.data!.data![index].product!.name}',
                                                    style:
                                                        navyTextStyle.copyWith(
                                                            fontWeight: bold),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                    '25 November 2022',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                  Text(
                                                    ' | ',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: yellowColor,
                                                    size: 15,
                                                  ),
                                                  Text(
                                                    '${provider.data!.data![index].product!.rewardPoints} Poin',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                              trailing: Text(
                                                'Rp. ${provider.data!.data![index].product!.price}',
                                                style: yellowTextStyle.copyWith(
                                                    fontWeight: bold,
                                                    fontSize: 18),
                                              ),
                                              onTap: () {},
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 20,
                                                left: 20,
                                                bottom: 10,
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: navyColor,
                                                  minimumSize: const Size(
                                                      double.infinity, 40),
                                                ),
                                                onPressed: () {},
                                                child: Text(
                                                  'Beli Lagi',
                                                  style: whiteTextStyle,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Center(
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 2,
                              color: whiteColor,
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: dangerColor,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Berhasil',
                                          style: succsesTextStyle.copyWith(
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Tarik Tunai',
                                      style: navyTextStyle.copyWith(
                                          fontWeight: bold),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      'BCL',
                                      style: gbTextStyle,
                                    ),
                                    const Text(' | '),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 15,
                                    ),
                                    const Text('14500 Poin'),
                                  ],
                                ),
                                trailing: Text(
                                  'Rp. 100.000',
                                  style: yellowTextStyle.copyWith(
                                      fontWeight: bold, fontSize: 18),
                                ),
                              ),
                            );
                          }),
                    ),
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
