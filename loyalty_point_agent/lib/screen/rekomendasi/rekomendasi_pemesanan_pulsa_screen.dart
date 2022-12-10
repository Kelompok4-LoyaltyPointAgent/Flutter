import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/transaction_model.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/providers/transaction_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/rekomendasi_transaksi_suksess.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RekomendasiPemesananPulsaScreen extends StatefulWidget {
  final String productId;
  final int id;
  final String nomer;
  const RekomendasiPemesananPulsaScreen({
    super.key,
    required this.productId,
    required this.id,
    required this.nomer,
  });

  @override
  State<RekomendasiPemesananPulsaScreen> createState() =>
      _RekomendasiPemesananPulsaScreenState();
}

class _RekomendasiPemesananPulsaScreenState
    extends State<RekomendasiPemesananPulsaScreen> {
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Detail Pemesanan',
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
      body: Consumer<PulsaProvider>(
        builder: (context, provider, _) {
          switch (provider.myState) {
            case MyState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MyState.loaded:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 5),
                    child: Text(
                      'Informasi Prabayar',
                      style: navyTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: ListTile(
                      title: Text(
                        'Nomer Telpon',
                        style: blackTextStyle,
                      ),
                      trailing: Text(
                        widget.nomer,
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: ListTile(
                      title: Text(
                        'Provider',
                        style: blackTextStyle,
                      ),
                      trailing: Text(
                        provider.data!.data![widget.id].provider,
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: ListTile(
                      title: Text(
                        'Voucher',
                        style: blackTextStyle,
                      ),
                      trailing: Text(
                        provider.data!.data![widget.id].name,
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                    ),
                  ),
                  Divider(
                    thickness: 5,
                    color: greyColor,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, bottom: 5),
                    child: Text(
                      'Detail Pembayaran',
                      style: navyTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: ListTile(
                      title: Text(
                        'Sub Total',
                        style: blackTextStyle,
                      ),
                      trailing: Text(
                        'Rp. ${provider.data!.data![widget.id].price}',
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: ListTile(
                      title: Text(
                        'Biaya Admin',
                        style: blackTextStyle,
                      ),
                      trailing: Text(
                        'Rp 1.000',
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                    ),
                  ),
                ],
              );
            case MyState.failed:
              return const Text('Ada Masalah');
            default:
              return const SizedBox();
          }
        },
      ),
      bottomSheet: Consumer<PulsaProvider>(
        builder: (context, provider, _) {
          switch (provider.myState) {
            case MyState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MyState.loaded:
              return Container(
                color: whiteColor,
                width: double.infinity,
                height: 70,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            'Rp. ${provider.data!.data![widget.id].price + 1000}',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () async {
                            transactionProvider.transaction(
                              TransactionModel(
                                productId: widget.productId,
                                number: widget.nomer,
                                email: userProvider.user!.email,
                                type: 'Purchase',
                              ),
                            );
                            Uri url = Uri.parse(
                              transactionProvider.pembelian!.data!.invoiceUrl!
                                  .toString(),
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                            await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: const AlertDialog(
                                  content: SingleChildScrollView(
                                    child: RekomendasiTransaksiSuksess(),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            color: navyColor,
                            height: double.infinity,
                            width: 120,
                            child: Center(
                              child: Text(
                                'Buat\nPesanan',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            case MyState.failed:
              return const Text('Ada Masalah');
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
