import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/transaction_provider.dart';
import 'package:loyalty_point_agent/screen/product/widget/verifikasi_akun.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/idr.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class DetailPemesananDataScreen extends StatefulWidget {
  const DetailPemesananDataScreen(
      {super.key, required this.number, required this.mail, required this.id});
  final String number;
  final String id;
  final String mail;

  @override
  State<DetailPemesananDataScreen> createState() =>
      _DetailPemesananScreenState();
}

class _DetailPemesananScreenState extends State<DetailPemesananDataScreen> {
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);

    return Consumer<PaketDataProvider>(
      builder: (context, provider, _) {
        switch (provider.myState3) {
          case MyState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case MyState.loaded:
            if (provider.dataById == null) {
              return const Text('Maaf, Belum Ada Data');
            } else {
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
                body: Column(
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
                          'Nomor Telepon',
                          style: blackTextStyle,
                        ),
                        trailing: Text(
                          widget.number,
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
                          provider.dataById!.provider,
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
                          provider.dataById!.name,
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
                          const EdgeInsets.only(left: 15, top: 20, bottom: 5),
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
                          FormatCurrency.convertToIdr(
                              provider.dataById!.price, 0),
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
                ),
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
                              FormatCurrency.convertToIdr(
                                  provider.dataById!.price + 1000, 0),
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
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor: grayishColor,
                                    content: const SingleChildScrollView(
                                      child: VerifikasiAkun(),
                                    ),
                                  ),
                                ),
                              );

                              // await transactionProvider.transaction(
                              //   TransactionModel(
                              //     productId: provider.dataById!.id,
                              //     number: widget.number,
                              //     email: widget.mail,
                              //     type: 'Purchase',
                              //   ),
                              // );

                              // Uri url = Uri.parse(
                              //   transactionProvider.pembelian!.data!.invoiceUrl
                              //       .toString(),
                              // );
                              // if (await canLaunchUrl(url)) {
                              //   await launchUrl(url,
                              //       mode: LaunchMode.externalApplication);
                              // } else {
                              //   throw 'Could not launch $url';
                              // }

                              // Future.delayed(const Duration(seconds: 3), () {
                              //   showDialog(
                              //     barrierDismissible: false,
                              //     context: context,
                              //     builder: (context) => BackdropFilter(
                              //       filter: ImageFilter.blur(
                              //           sigmaX: 10, sigmaY: 10),
                              //       child: WillPopScope(
                              //         onWillPop: () async => false,
                              //         child: AlertDialog(
                              //           shape: RoundedRectangleBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(20)),
                              //           backgroundColor: backgroundColor,
                              //           content: const SingleChildScrollView(
                              //             child: ProductTransaksiBerhasil(),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   );
                              // });
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
          case MyState.failed:
            return const Text('Ada Masalah');
          default:
            return const SizedBox();
        }
      },
    );
  }
}
