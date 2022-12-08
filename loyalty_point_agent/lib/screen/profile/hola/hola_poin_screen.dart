import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/profile/hola/data/data_hola.dart';
import 'package:loyalty_point_agent/screen/profile/hola/widget/feedback.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:sizer/sizer.dart';

class HolaPoinScreen extends StatefulWidget {
  const HolaPoinScreen({super.key});

  @override
  State<HolaPoinScreen> createState() => _HolaPoinScreenState();
}

class _HolaPoinScreenState extends State<HolaPoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Hola Poin',
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
      body: Stack(
        children: [
          Container(
            height: 40.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                // image: AssetImage('assets/logo_utama.png'),
                image: AssetImage('assets/portrait3.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hola Poin',
                        style: yellowTextStyle.copyWith(
                            fontSize: 24, fontWeight: bold),
                      ),
                      Text(
                        'Temukan pertanyaan\nuntuk menjawab permasalahan Anda !',
                        style: navyTextStyle.copyWith(fontWeight: semiBold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: yellowColor,
                        child: ExpansionTile(
                          title: Text(
                            'Masa Berlaku Hola Poin',
                            style: navyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          children: [
                            ListTile(
                              tileColor: whiteColor,
                              subtitle: Column(
                                children: [
                                  Text(
                                    'Semua poin yang telah Anda kumpulkan akan dihapus per 31 Desember setiap tahunnya.',
                                    style: blackRegulerTextStyle,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: yellowColor,
                        child: ExpansionTile(
                          title: Text(
                            'Keuntungan yang saya dapatkan setelah memiliki Hola POIN',
                            style: navyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          children: [
                            ListTile(
                              tileColor: whiteColor,
                              subtitle: Column(
                                children: [
                                  Text(
                                    DataHola.poin1,
                                    style: blackRegulerTextStyle,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const FeedBack(),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
