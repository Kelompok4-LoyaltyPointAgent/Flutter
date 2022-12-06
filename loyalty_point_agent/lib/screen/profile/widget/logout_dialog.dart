import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/login_provider.dart';
import 'package:loyalty_point_agent/screen/register/register.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    final deleteToken = Provider.of<LoginProvider>(context, listen: false);
    return Column(
      children: [
        Image.asset(
          'assets/onboarding_1.png',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Konfirmasi Keluar Aplikasi',
          style: yellowTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Apakah anda yakin ingin meninggalkan\nAplikasi Hola Pulsa ?',
          textAlign: TextAlign.center,
          style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: yellowColor,
                minimumSize: const Size(100, 40),
              ),
              onPressed: () {
                deleteToken.deleteToken();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ),
                );
              },
              child: Text(
                'Ya',
                style: navyTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: whiteColor,
                minimumSize: const Size(100, 40),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Tidak',
                style: navyTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
