import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/login/login.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class BerhasilSimpanKataSandiBaru extends StatefulWidget {
  const BerhasilSimpanKataSandiBaru({super.key});

  @override
  State<BerhasilSimpanKataSandiBaru> createState() =>
      _BerhasilSimpanKataSandiBaruState();
}

class _BerhasilSimpanKataSandiBaruState
    extends State<BerhasilSimpanKataSandiBaru> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
        (route) => false,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
        child: Column(
          children: [
            Image.asset(
              'assets/verfikasi berhasil.png',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Berhasil\nSilahkan login kembali.',
              style:
                  yellowTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
