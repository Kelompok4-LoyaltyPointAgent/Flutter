import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/navbar/navbar.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class RekomendasiTransaksiSuksess extends StatelessWidget {
  const RekomendasiTransaksiSuksess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/transaksi_suksess.png',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Transaksi Berhasil',
          style: navyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Terima kasih sudah melakukan transaksi. Nikmati promo menarik lainnya dan jangan terlewatkan',
          style: blackTextStyle.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 107,
              height: 34,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavBarScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  side: BorderSide(color: navyColor),
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Selesai',
                  style: navyTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 107,
              height: 34,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const NavBarScreen(),
                  //   ),
                  // );
                },
                style: TextButton.styleFrom(
                  backgroundColor: navyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Beli Lagi',
                  style: whiteTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Lihat riwayat pembelian ?',
            style: yellowTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
