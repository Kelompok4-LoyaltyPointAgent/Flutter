import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/navbar/navbar.dart';
import 'package:loyalty_point_agent/screen/profile/riwayat_transaksi_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class PoinTransaksiSuksess extends StatelessWidget {
  const PoinTransaksiSuksess({super.key});

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
          'Penukaran Berhasil',
          style: yellowTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Pembelian produk dengan poin berhasil dilakukan',
          style: whiteTextStyle.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 230,
          height: 42,
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
              backgroundColor: yellowColor,
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
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const RiwayatTransaksiScreen(),
              ),
            );
          },
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
