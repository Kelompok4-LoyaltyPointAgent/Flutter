import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/rekomendasi_transaksi_suksess.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class RekomendasiPemesananPulsaScreen extends StatefulWidget {
  final int id;
  final String nomer;
  const RekomendasiPemesananPulsaScreen({
    super.key,
    required this.id,
    required this.nomer,
  });

  @override
  State<RekomendasiPemesananPulsaScreen> createState() =>
      _RekomendasiPemesananPulsaScreenState();
}

class _RekomendasiPemesananPulsaScreenState
    extends State<RekomendasiPemesananPulsaScreen> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
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
      body: Consumer<PulsaProvider>(builder: (context, provider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20, bottom: 5),
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
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
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
      }),
      bottomSheet: Container(
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
                    'Hitung Sendiri !!!',
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
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
      ),
    );
  }
}
