import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class DialaogGagalLogin extends StatelessWidget {
  const DialaogGagalLogin({super.key});

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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [
            Image.asset(
              'assets/login_berhasil.png',
              height: 180,
              width: 180,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Yah, gagal login !',
              style:
                  yellowTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Email atau password yang anda\n masukan salah, silahkan coba lagi',
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
                Navigator.pop(context);
              },
              child: Text(
                'Yuk, Coba Lagi',
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
