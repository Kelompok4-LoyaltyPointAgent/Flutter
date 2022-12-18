import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/faq_provider.dart';
import 'package:loyalty_point_agent/screen/profile/hola/widget/feedback.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HolaPoinScreen extends StatefulWidget {
  const HolaPoinScreen({super.key});

  @override
  State<HolaPoinScreen> createState() => _HolaPoinScreenState();
}

class _HolaPoinScreenState extends State<HolaPoinScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<FaqProvider>(context, listen: false).fetchData();
    });
  }

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
                    horizontal: 16,
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
                      Consumer<FaqProvider>(
                        builder: (context, provider, _) {
                          return SizedBox(
                            // height: 230,
                            child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: provider.holaPoin.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: yellowColor,
                                  child: ExpansionTile(
                                    title: Text(
                                      provider.holaPoin[index].question,
                                      style: navyTextStyle.copyWith(
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                    children: [
                                      ListTile(
                                        tileColor: whiteColor,
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                provider.holaPoin[index].answer,
                                                style: blackRegulerTextStyle,
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
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
