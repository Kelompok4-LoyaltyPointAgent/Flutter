import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/login/lupa_password/kata_sandi_baru.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class DialogBerhsilVerifikasi extends StatefulWidget {
  const DialogBerhsilVerifikasi({super.key});

  @override
  State<DialogBerhsilVerifikasi> createState() =>
      _DialogBerhsilVerifikasiState();
}

class _DialogBerhsilVerifikasiState extends State<DialogBerhsilVerifikasi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          children: [
            Image.asset(
              'assets/verfikasi berhasil.png',
              height: 180,
              width: 180,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Selamat, Anda berhasil masuk ',
              style:
                  yellowTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Silahkan Lakukan perubahan kata sandi\nbaru untuk masuk dan bertransaksi ',
              textAlign: TextAlign.center,
              style: whiteTextStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: yellowColor,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KataSandiBaru(),
                  ),
                );
              },
              child: Text(
                'Ubah Kata Sandi',
                style: blackRegulerTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
