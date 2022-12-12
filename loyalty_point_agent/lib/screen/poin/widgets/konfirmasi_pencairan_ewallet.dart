import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/poin/status_pencairan_ewallet_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class KonfirmasiPencairanEwallet extends StatelessWidget {
  const KonfirmasiPencairanEwallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/konfirmasi.png',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Konfirmasi Pencairan',
          style: yellowTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Apakah anda yakin ingin melakukan pencairan dana ?',
          style: whiteTextStyle.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 110,
              height: 42,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const StatusPencairanEwalletScreen(),
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
                  'Ya',
                  style: navyTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 110,
              height: 42,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Tidak',
                  style: navyTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
