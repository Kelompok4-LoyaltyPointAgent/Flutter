import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/navbar/navbar.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class LoginBerhasil extends StatelessWidget {
  const LoginBerhasil({super.key});

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
              'Selamat Datang Sobat Hola !',
              style:
                  yellowTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Nikmati berbagai voucher dan promo\nmenarik untuk dukung internetan tanpa batas',
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavBarScreen(),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                'Beranda',
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
