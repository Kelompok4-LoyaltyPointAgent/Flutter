import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/screen/home/beranda_screen.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class DetailPemesananScreen extends StatefulWidget {
  const DetailPemesananScreen({super.key, required this.id});

  final int id;

  @override
  State<DetailPemesananScreen> createState() => _DetailPemesananScreenState();
}

class _DetailPemesananScreenState extends State<DetailPemesananScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaketDataProvider>(
      builder: (context, provider, _) {
        switch (provider.myState) {
          case MyState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case MyState.loaded:
            if (provider.data == null) {
              return const Text('Kosong');
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
                          'Belum Dikerjakan',
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
                          'Rp ${provider.data!.data![widget.id].price}',
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
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const BerandaScreen(),
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
          case MyState.failed:
            return const Text('Ada Masalah');
          default:
            return const SizedBox();
        }
      },
    );
  }
}
