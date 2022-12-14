import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/rekomendasi_pemesanan_pulsa_screen.dart';
import 'package:loyalty_point_agent/utils/idr.dart';
import 'package:loyalty_point_agent/utils/provider_number.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../utils/finite_state.dart';

class DetailPulsaScreen extends StatefulWidget {
  final String productId;
  final String pro;
  final int id;
  const DetailPulsaScreen({
    super.key,
    required this.productId,
    required this.id,
    required this.pro,
  });

  @override
  State<DetailPulsaScreen> createState() => _DetailPulsaScreenState();
}

class _DetailPulsaScreenState extends State<DetailPulsaScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nomerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Detail Pulsa',
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
      body: Form(
        key: formKey,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nomor Telepon',
                    style: navyTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: nomerController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: yellowColor),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Contoh : 081234567890',
                      fillColor: whiteColor,
                      filled: true,
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = RegExp(patttern);
                      if (value!.isEmpty) {
                        return 'Mohon Masukkan Nomor Telepon';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Mohon Masukkan Nomor Telepon Yang Benar';
                      } else if (checkprovider(value) != widget.pro) {
                        return 'Mohon Masukkan Nomor Telpon Sesuai Provider';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 5,
              color: greyColor,
            ),
            Consumer<PulsaProvider>(builder: (context, provider, _) {
              switch (provider.myState) {
                case MyState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case MyState.loaded:
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            provider.recommended[widget.id].name!,
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
                              provider.recommended[widget.id].provider!,
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
                              '${provider.recommended[widget.id].credit!.activePeriod} Hari',
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
                              Icons.smartphone_outlined,
                              color: yellowColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Nominial Pulsa',
                              style: blackTextStyle,
                            ),
                            const Spacer(),
                            Text(
                              '-',
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
                              '200 Menit',
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
                              '-',
                              style: blackTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                case MyState.failed:
                  return const Text('Ada Masalah');
                default:
                  return const SizedBox();
              }
            }),
          ],
        ),
      ),
      bottomSheet: Container(
        //margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Consumer<PulsaProvider>(
          builder: (context, provider, _) {
            switch (provider.myState) {
              case MyState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case MyState.loaded:
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total',
                            style: whiteTextStyle,
                          ),
                          Text(
                            FormatCurrency.convertToIdr(
                                provider.recommended[widget.id].price, 0),
                            style: whiteTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {
                            final isValidForm =
                                formKey.currentState!.validate();
                            if (isValidForm) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RekomendasiPemesananPulsaScreen(
                                    id: widget.id,
                                    nomer: nomerController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
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
                      ),
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
      ),
    );
  }
}
