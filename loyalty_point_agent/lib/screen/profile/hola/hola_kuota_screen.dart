import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/profile/hola/data/data_hola.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:sizer/sizer.dart';

class HolaKuotaScreen extends StatefulWidget {
  const HolaKuotaScreen({super.key});

  @override
  State<HolaKuotaScreen> createState() => _HolaKuotaScreenState();
}

class _HolaKuotaScreenState extends State<HolaKuotaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Hola Kuota',
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
                image: AssetImage('assets/portrait2.webp'),
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
                        'Hola Kuota',
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
                            DataHola.data4,
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
                                    DataHola.data4_2,
                                    style: blackRegulerTextStyle,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      DataHola.data4_3,
                                      style: blackRegulerTextStyle,
                                      textAlign: TextAlign.justify,
                                    ),
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
                            DataHola.data5,
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
                                    DataHola.data5_2,
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
                            DataHola.data6,
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
                                    DataHola.data6_2,
                                    style: blackRegulerTextStyle,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      DataHola.data6_3,
                                      style: blackRegulerTextStyle,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
