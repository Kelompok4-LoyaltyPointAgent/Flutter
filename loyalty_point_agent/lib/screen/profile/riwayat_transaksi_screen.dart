import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/history_provider.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/idr.dart';
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
    String reedem = 'Redeem';
    String berhasil = 'Success';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Riwayat ',
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
                          if (provider.data!.data == null) {
                            return const Text('Belum Ada Data');
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Center(
                                child: ListView.builder(
                                    itemCount: provider.purchase!.length,
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
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 5,
                                                        backgroundColor: berhasil !=
                                                                provider
                                                                    .purchase![
                                                                        index]
                                                                    .status
                                                            ? dangerColor
                                                            : succesColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      berhasil ==
                                                              provider
                                                                  .purchase![
                                                                      index]
                                                                  .status
                                                          ? Text(
                                                              provider
                                                                  .purchase![
                                                                      index]
                                                                  .status
                                                                  .toString(),
                                                              style:
                                                                  succsesTextStyle
                                                                      .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    medium,
                                                              ),
                                                            )
                                                          : Text(
                                                              provider
                                                                  .purchase![
                                                                      index]
                                                                  .status
                                                                  .toString(),
                                                              style:
                                                                  dangerTextStyle
                                                                      .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    medium,
                                                              ),
                                                            ),
                                                      Text(
                                                        ' | ',
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontSize: 13),
                                                      ),
                                                      Text(
                                                        provider
                                                            .purchase![index]
                                                            .type
                                                            .toString(),
                                                        style:
                                                            blackRegulerTextStyle
                                                                .copyWith(
                                                          fontSize: 12,
                                                          fontWeight: medium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${provider.purchase![index].product!.name}',
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
                                                        .copyWith(fontSize: 12),
                                                  ),
                                                  Text(
                                                    ' | ',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 12),
                                                  ),
                                                  Icon(
                                                    Icons.add_circle_rounded,
                                                    color: succesColor,
                                                    size: 15,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '${provider.purchase![index].product!.rewardPoints} Poin',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              trailing: Text(
                                                FormatCurrency.convertToIdr(
                                                    provider.purchase![index]
                                                        .product!.price,
                                                    0),
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
                  Consumer<HistoryProvider>(
                    builder: (context, provider, _) {
                      switch (provider.myState) {
                        case MyState.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case MyState.loaded:
                          if (provider.data!.data == null) {
                            return const Text('Belum Ada Data');
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Center(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: 2,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Card(
                                            elevation: 2,
                                            color: whiteColor,
                                            child: ListTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 5,
                                                        backgroundColor:
                                                            berhasil !=
                                                                    provider
                                                                        .redeem[
                                                                            index]
                                                                        .status
                                                                ? dangerColor
                                                                : succesColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      berhasil ==
                                                              provider
                                                                  .redeem[index]
                                                                  .status
                                                          ? Text(
                                                              provider
                                                                  .redeem[index]
                                                                  .status
                                                                  .toString(),
                                                              style:
                                                                  succsesTextStyle
                                                                      .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    medium,
                                                              ),
                                                            )
                                                          : Text(
                                                              provider
                                                                  .redeem[index]
                                                                  .status
                                                                  .toString(),
                                                              style:
                                                                  dangerTextStyle
                                                                      .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    medium,
                                                              ),
                                                            ),
                                                      Text(
                                                        ' | ',
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontSize: 13),
                                                      ),
                                                      Text(
                                                        provider
                                                            .redeem[index].type
                                                            .toString(),
                                                        style:
                                                            blackRegulerTextStyle
                                                                .copyWith(
                                                          fontSize: 12,
                                                          fontWeight: medium,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    reedem ==
                                                            provider
                                                                .redeem[index]
                                                                .type
                                                        ? '${provider.redeem[index].product!.name}'
                                                        : 'Transfer Bank',
                                                    style:
                                                        navyTextStyle.copyWith(
                                                            fontWeight: bold),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                    reedem ==
                                                            provider
                                                                .redeem[index]
                                                                .type
                                                        ? '${provider.redeem[index].product!.provider}'
                                                        : '${provider.redeem[index].method}',
                                                    style: gbTextStyle,
                                                  ),
                                                  const Text(' | '),
                                                  Icon(
                                                    Icons.remove_circle,
                                                    color: dangerColor,
                                                    size: 15,
                                                  ),
                                                  Text(reedem ==
                                                          provider.redeem[index]
                                                              .type
                                                      ? '${provider.redeem[index].product!.rewardPoints} Poin'
                                                      : '${provider.redeem[index].amount} Poin'),
                                                ],
                                              ),
                                              trailing: Text(
                                                reedem ==
                                                        provider
                                                            .redeem[index].type
                                                    ? '${provider.redeem[index].product!.price}'
                                                    : FormatCurrency
                                                        .convertToIdr(
                                                            provider
                                                                .redeem[index]
                                                                .amount,
                                                            0),
                                                style: yellowTextStyle.copyWith(
                                                    fontWeight: bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
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
      ),
    );
  }
}
