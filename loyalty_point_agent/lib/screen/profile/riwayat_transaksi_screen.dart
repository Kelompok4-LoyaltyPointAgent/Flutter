import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/history_provider.dart';
import 'package:loyalty_point_agent/providers/transaction_provider.dart';
import 'package:loyalty_point_agent/screen/navbar/navbar.dart';
import 'package:loyalty_point_agent/screen/product/detail_paket_data_screen.dart';
import 'package:loyalty_point_agent/screen/product/detail_pemesanan_data.dart';
import 'package:loyalty_point_agent/screen/product/detail_pemesanan_pulsa.dart';
import 'package:loyalty_point_agent/screen/product/widget/transaksi_sukses.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/idr.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

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
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      Provider.of<HistoryProvider>(context, listen: false).fetchHistory();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    TransactionProvider link =
        Provider.of<TransactionProvider>(context, listen: false);

    String reedem = 'Redeem';
    String berhasil = 'Success';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NavBarScreen(
                    pageIndex: 2,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back)),
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
                          // return const Center(
                          //   child: CircularProgressIndicator(),
                          // );
                          return Shimmer.fromColors(
                            baseColor: Colors.black12,
                            highlightColor: Colors.white10,
                            child: ListView.builder(
                                itemCount: provider.data!.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: SizedBox(height: 130, child: Card()),
                                  );
                                }),
                          );
                        case MyState.loaded:
                          if (provider.data!.data == null) {
                            return const Center(child: Text('Belum Ada Data'));
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
                                                        backgroundColor: berhasil ==
                                                                provider
                                                                    .purchase![
                                                                        index]
                                                                    .status
                                                            ? succesColor
                                                            : provider
                                                                        .purchase![
                                                                            index]
                                                                        .status ==
                                                                    'Pending'
                                                                ? lightYellow
                                                                : dangerColor,
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
                                                          : provider
                                                                      .purchase![
                                                                          index]
                                                                      .status ==
                                                                  'Pending'
                                                              ? Text(
                                                                  provider
                                                                      .purchase![
                                                                          index]
                                                                      .status
                                                                      .toString(),
                                                                  style: navyTextStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        12,
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
                                                                  style: dangerTextStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        12,
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
                                                      fontWeight: bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                    '${provider.purchase![index].createdDate}',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 10),
                                                  ),
                                                  Text(
                                                    ' | ',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 10),
                                                  ),
                                                  Icon(
                                                    Icons.add_circle_rounded,
                                                    color: succesColor,
                                                    size: 12,
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    '${provider.purchase![index].product!.rewardPoints} Poin',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                              trailing: Text(
                                                FormatCurrency.convertToIdr(
                                                    provider.purchase![index]
                                                        .amount,
                                                    0),
                                                style: yellowTextStyle.copyWith(
                                                    fontWeight: bold,
                                                    fontSize: 16),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) => provider
                                                                .purchase![
                                                                    index]
                                                                .product!
                                                                .type ==
                                                            'Credit'
                                                        ? DetailPemesananPulsaScreen(
                                                            id: provider
                                                                .purchase![
                                                                    index]
                                                                .productId
                                                                .toString(),
                                                            number: provider
                                                                .purchase![
                                                                    index]
                                                                .transactionDetail!
                                                                .number!,
                                                            mail: provider
                                                                .purchase![
                                                                    index]
                                                                .transactionDetail!
                                                                .email!,
                                                            pro: provider
                                                                .purchase![
                                                                    index]
                                                                .product!
                                                                .provider!,
                                                          )
                                                        : ProductDetailPaketDataScreen(
                                                            id: provider
                                                                .purchase![
                                                                    index]
                                                                .productId
                                                                .toString(),
                                                            number: provider
                                                                .purchase![
                                                                    index]
                                                                .transactionDetail!
                                                                .number!,
                                                            mail: provider
                                                                .purchase![
                                                                    index]
                                                                .transactionDetail!
                                                                .email!,
                                                          ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 20,
                                                left: 20,
                                                bottom: 10,
                                              ),
                                              child:
                                                  provider.purchase![index]
                                                              .status !=
                                                          'Pending'
                                                      ? ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                navyColor,
                                                            minimumSize:
                                                                const Size(
                                                                    double
                                                                        .infinity,
                                                                    40),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(
                                                              MaterialPageRoute(
                                                                builder: (context) => provider
                                                                            .purchase![index]
                                                                            .product!
                                                                            .type ==
                                                                        'Credit'
                                                                    ? DetailPemesananPulsaScreen(
                                                                        id: provider
                                                                            .purchase![index]
                                                                            .productId
                                                                            .toString(),
                                                                        number: provider
                                                                            .purchase![index]
                                                                            .transactionDetail!
                                                                            .number!,
                                                                        mail: provider
                                                                            .purchase![index]
                                                                            .transactionDetail!
                                                                            .email!,
                                                                        pro: provider
                                                                            .purchase![index]
                                                                            .product!
                                                                            .provider!,
                                                                      )
                                                                    : DetailPemesananDataScreen(
                                                                        id: provider
                                                                            .purchase![index]
                                                                            .productId
                                                                            .toString(),
                                                                        number: provider
                                                                            .purchase![index]
                                                                            .transactionDetail!
                                                                            .number!,
                                                                        mail: provider
                                                                            .purchase![index]
                                                                            .transactionDetail!
                                                                            .email!,
                                                                      ),
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            'Beli Lagi',
                                                            style:
                                                                whiteTextStyle,
                                                          ),
                                                        )
                                                      : ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                navyColor,
                                                            minimumSize:
                                                                const Size(
                                                                    double
                                                                        .infinity,
                                                                    40),
                                                          ),
                                                          onPressed: () async {
                                                            await link
                                                                .payPendingTransactions(
                                                              provider
                                                                  .purchase![
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                            );

                                                            Uri url = Uri.parse(
                                                                link
                                                                    .newLink!
                                                                    .data!
                                                                    .invoiceUrl
                                                                    .toString());

                                                            if (await canLaunchUrl(
                                                                url)) {
                                                              await launchUrl(
                                                                url,
                                                                mode: LaunchMode
                                                                    .externalApplication,
                                                              );
                                                              closeInAppWebView();
                                                            } else {
                                                              throw 'Could not launch $url';
                                                            }

                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 3),
                                                                () {
                                                              showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        BackdropFilter(
                                                                  filter: ImageFilter
                                                                      .blur(
                                                                          sigmaX:
                                                                              10,
                                                                          sigmaY:
                                                                              10),
                                                                  child:
                                                                      WillPopScope(
                                                                    onWillPop:
                                                                        () async =>
                                                                            false,
                                                                    child:
                                                                        AlertDialog(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                      backgroundColor:
                                                                          backgroundColor,
                                                                      content:
                                                                          const SingleChildScrollView(
                                                                        child:
                                                                            ProductTransaksiBerhasil(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                          },
                                                          child: Text(
                                                            'Bayar',
                                                            style:
                                                                whiteTextStyle,
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
                          return const Center(child: Text('Ada Masalah'));
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
                            return const Center(child: Text('Belum Ada Data'));
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Center(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: provider.redeem.length,
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
                                                        backgroundColor: berhasil ==
                                                                provider
                                                                    .redeem[
                                                                        index]
                                                                    .status
                                                            ? succesColor
                                                            : provider
                                                                        .redeem[
                                                                            index]
                                                                        .status ==
                                                                    'Pending'
                                                                ? lightYellow
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
                                                          : provider
                                                                      .redeem[
                                                                          index]
                                                                      .status ==
                                                                  'Pending'
                                                              ? Text(
                                                                  provider
                                                                      .redeem[
                                                                          index]
                                                                      .status
                                                                      .toString(),
                                                                  style: navyTextStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        medium,
                                                                  ),
                                                                )
                                                              : Text(
                                                                  provider
                                                                      .redeem[
                                                                          index]
                                                                      .status
                                                                      .toString(),
                                                                  style: dangerTextStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        12,
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
                                                        : provider.redeem[index]
                                                                        .method ==
                                                                    'BRI' ||
                                                                provider
                                                                        .redeem[
                                                                            index]
                                                                        .method ==
                                                                    'BCA' ||
                                                                provider
                                                                        .redeem[
                                                                            index]
                                                                        .method ==
                                                                    'Mandiri' ||
                                                                provider
                                                                        .redeem[
                                                                            index]
                                                                        .method ==
                                                                    'BNI'
                                                            ? 'Transfer Bank'
                                                            : 'E-Wallet',
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
                                                    ? '${provider.redeem[index].product!.pricePoints}'
                                                    : FormatCurrency
                                                        .convertToIdr(
                                                            provider
                                                                .redeem[index]
                                                                .amount,
                                                            0),
                                                style: yellowTextStyle.copyWith(
                                                    fontWeight: bold,
                                                    fontSize: 16),
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
