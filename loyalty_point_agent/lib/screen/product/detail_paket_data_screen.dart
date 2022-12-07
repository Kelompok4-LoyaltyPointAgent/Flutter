import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/syarat_ketentuan_poin.dart';
import 'package:loyalty_point_agent/screen/product/detail_pemesanan.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/deskripsi_paket_item.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class ProductDetailPaketDataScreen extends StatefulWidget {
  const ProductDetailPaketDataScreen({required this.id, super.key});

  final int id;

  @override
  State<ProductDetailPaketDataScreen> createState() =>
      _DetailPaketDataScreenState();
}

class _DetailPaketDataScreenState extends State<ProductDetailPaketDataScreen> {
  String check = '-1';
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
              return const Text('Sorry, your data still empty');
            } else {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: navyColor,
                  title: Text(
                    'Detail Paket Data',
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
                body: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              provider.data!.data![widget.id].name,
                              style: navyTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.credit_card_outlined,
                                color: yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Provider',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                provider.data!.data![widget.id].provider,
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Masa Aktif',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                '${provider.data!.data![widget.id].package.activePeriod} Hari',
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Internet Utama',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                '${provider.data!.data![widget.id].package.mainInternet} GB',
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Internet Malam',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                '${provider.data!.data![widget.id].package.nightInternet} GB',
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.list,
                                color: yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Sosial Media',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                '${provider.data!.data![widget.id].package.socialMedia} GB',
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                color: yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Telepon',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                // ignore: unrelated_type_equality_checks
                                check == true
                                    ? provider
                                        .data!.data![widget.id].package.call
                                        .toString()
                                    : 'Sepuasnya',
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'SMS',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                '${provider.data!.data![widget.id].package.sms}',
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: greyColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: grayishColor,
                            ),
                            child: ExpansionTile(
                              title: Text(
                                'Deskripsi Paket',
                                style: navyTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                              children: const [
                                DeskripsiPaketItem(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: grayishColor,
                            ),
                            child: ExpansionTile(
                              title: Text(
                                'Syarat dan Ketentuan',
                                style: navyTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                              children: const [
                                SyaratKetentuanPoin(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 130,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                bottomSheet: Container(
                  //margin: const EdgeInsets.only(top: 50),
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 16, right: 16, bottom: 10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub Total',
                                style: whiteTextStyle,
                              ),
                              Text(
                                'Rp. ${provider.data!.data![widget.id].price}',
                                style: whiteTextStyle.copyWith(
                                    fontWeight: semiBold),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPemesananScreen(id: widget.id),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              minimumSize: const Size(double.infinity, 40),
                              backgroundColor: yellowColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Lanjutkan Pemesanan',
                              style: navyTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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