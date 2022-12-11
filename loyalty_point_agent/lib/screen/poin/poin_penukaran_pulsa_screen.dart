import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/transaction_model.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/providers/transaction_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/poin_transaksi_suksess.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class PoinPenukaranPulsaScreen extends StatefulWidget {
  final int id;
  final String nomer;
  const PoinPenukaranPulsaScreen({
    super.key,
    required this.id,
    required this.nomer,
  });

  @override
  State<PoinPenukaranPulsaScreen> createState() =>
      _PoinPenukaranPulsaScreenState();
}

class _PoinPenukaranPulsaScreenState extends State<PoinPenukaranPulsaScreen> {
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
                        userProvider.user!.poin.toString(),
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
                            'Total Poin',
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            provider.data!.data![widget.id].pricePoints
                                .toString(),
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
                            int limit =
                                int.parse(userProvider.user!.poin.toString());
                            if (limit >=
                                provider.data!.data![widget.id].pricePoints) {
                              await transactionProvider.transaction(
                                TransactionModel(
                                  productId: provider.data!.data![widget.id].id,
                                  number: widget.nomer,
                                  email: userProvider.user!.email,
                                  type: 'Redeem',
                                ),
                              );

                              await showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: WillPopScope(
                                    onWillPop: () async => false,
                                    child: const AlertDialog(
                                      content: SingleChildScrollView(
                                        child: PoinTransaksiSuksess(),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Poin Tidak Cukup',
                                  ),
                                ),
                              );
                            }
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
