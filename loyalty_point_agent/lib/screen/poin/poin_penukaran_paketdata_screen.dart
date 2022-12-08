import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/poin_transaksi_suksess.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class PoinPenukaranPaketDataScreen extends StatefulWidget {
  final int id;
  final String nomer;
  const PoinPenukaranPaketDataScreen({
    super.key,
    required this.id,
    required this.nomer,
  });

  @override
  State<PoinPenukaranPaketDataScreen> createState() =>
      _DetailPaketDataScreenState();
}

class _DetailPaketDataScreenState extends State<PoinPenukaranPaketDataScreen> {
  final formKey = GlobalKey<FormState>();
  String check = '-1';
  TextEditingController nomerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Detail Penukaran',
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
      body: Consumer<PaketDataProvider>(
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
                        'Poin yang dibutuhkan',
                        style: blackTextStyle,
                      ),
                      trailing: Text(
                        provider.data!.data![widget.id].pricePoints.toString(),
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      visualDensity: const VisualDensity(vertical: -4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: ListTile(
                      title: Text(
                        'Poin saat ini',
                        style: blackTextStyle,
                      ),
                      trailing: Text(
                        'Belum dikerjain',
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
      bottomSheet: Consumer<PaketDataProvider>(
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
                            'Total Poin',
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            'Belum Dikerjakan',
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
                          onTap: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: const AlertDialog(
                                  content: SingleChildScrollView(
                                    child: PoinTransaksiSuksess(),
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