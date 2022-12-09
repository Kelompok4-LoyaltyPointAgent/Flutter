import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/profile/hola/data/data_hola.dart';
import 'package:loyalty_point_agent/screen/profile/hola/widget/feedback.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:sizer/sizer.dart';

class HolaPulsaScreen extends StatefulWidget {
  const HolaPulsaScreen({super.key});

  @override
  State<HolaPulsaScreen> createState() => _HolaPulsaScreenState();
}

class _HolaPulsaScreenState extends State<HolaPulsaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Hola Pulsa',
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
                image: AssetImage('assets/potrait4.webp'),
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
                        'Hola Pulsa',
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
                            DataHola.data1,
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
                                    DataHola.data1_2,
                                    style: blackRegulerTextStyle,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      DataHola.data1_3,
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
                            DataHola.data2,
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
                                    DataHola.data2_2,
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
                            DataHola.data3,
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
                                    DataHola.data3_2,
                                    style: blackRegulerTextStyle,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      DataHola.data3_3,
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
