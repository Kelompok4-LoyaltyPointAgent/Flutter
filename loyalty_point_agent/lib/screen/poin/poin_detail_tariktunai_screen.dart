import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/konfirmasi_pencairan_tariktunai.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class PoinDetailTarikTunaiScreen extends StatelessWidget {
  const PoinDetailTarikTunaiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Detail Pencairan',
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
                'Nomer Rekening',
                style: blackTextStyle,
              ),
              trailing: Text(
                '3123123131',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: ListTile(
              title: Text(
                'Bank',
                style: blackTextStyle,
              ),
              trailing: Text(
                'BNI',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: ListTile(
              title: Text(
                'Atas Nama',
                style: blackTextStyle,
              ),
              trailing: Text(
                'Kartika',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_rounded,
                  color: navyColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Pastikan Identitas Sudah Benar',
                  style: navyTextStyle,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 5,
            color: greyColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
            child: Text(
              'Detail Pencairan',
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
                'Nominal',
                style: blackTextStyle,
              ),
              trailing: Text(
                '5000',
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
                '0',
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
                    'Total Penarikan',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    '50000',
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
                    // int limit =
                    //     int.parse(userProvider.user!.poin.toString());
                    // if (limit >=
                    //     provider.data!.data![widget.id].pricePoints) {
                    //   await transactionProvider.transaction(
                    //     TransactionModel(
                    //       productId: provider.data!.data![widget.id].id,
                    //       number: widget.nomer,
                    //       email: userProvider.user!.email,
                    //       type: 'Redeem',
                    //     ),
                    //   );

                    await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: backgroundColor,
                          content: const SingleChildScrollView(
                            child: KonfirmasiPencairanTarikTunai(),
                          ),
                        ),
                      ),
                    );
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text(
                    //         'Poin Tidak Cukup',
                    //       ),
                    //     ),
                    //   );
                    // }
                  },
                  child: Container(
                    color: navyColor,
                    height: double.infinity,
                    width: 120,
                    child: Center(
                      child: Text(
                        'Cairkan',
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
