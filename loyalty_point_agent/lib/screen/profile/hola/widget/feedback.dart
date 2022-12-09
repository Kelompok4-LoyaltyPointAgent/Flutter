import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/profile/hola/widget/form_feedback_setuju.dart';
import 'package:loyalty_point_agent/screen/profile/hola/widget/form_feedback_tidak_setuju.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 3, //spread radius
                blurRadius: 4, // blur radius
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                'Apakah Artikel ini dapat\nmembantu Anda ?',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 107,
                    height: 34,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: const FormFeedBackSetuju(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(color: navyColor),
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
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 107,
                    height: 34,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: const FormFeedBackTidaSetuju(),
                          ),
                        );
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
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Masih memerlukan Bantuan ?',
          style: yellowTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Silahkan sampaikan permasalahan Anda',
          style: navyTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () async {
            Uri url = Uri.parse('https://wa.me/628139122779');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            width: 170,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 4, // blur radius
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/background_card.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/bantuan.png',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Customer Service',
                  style: navyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Layanan 24 Jam',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
