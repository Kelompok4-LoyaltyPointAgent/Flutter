import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/pulsa_model.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/detail_paket_data_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/detail_pulsa_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/rekomendasi_card.dart';
import 'package:loyalty_point_agent/screen/product/pulsa_paket_data_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/rekomendasi_screen.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<UserProvider>(context, listen: false).fetchUsersData();
    });
    Future.delayed(Duration.zero, () {
      Provider.of<PulsaProvider>(context, listen: false).fetchPulsaData();
    });
  }

  @override
  Widget build(BuildContext context) {
    PulsaProvider pulsaProvider = Provider.of<PulsaProvider>(context);
    return Scaffold(
      //backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Consumer<UserProvider>(
          builder: (context, provider, _) {
            switch (provider.myState) {
              case MyState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case MyState.loaded:
                if (provider.user == null) {
                  return const Text('Sorry, your data still empty');
                } else {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.user!.name.toString(),
                          style: navyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: yellowColor,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              provider.user!.poin.toString(),
                              style: yellowTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ]);
                }
              case MyState.failed:
                return const Text('Oops, something went wrong!');
              default:
                return const SizedBox();
            }
          },
        ),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              size: 30,
              color: yellowColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.info_outline,
              size: 30,
              color: yellowColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                child: Text(pulsaProvider.listData[index].email!),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: pulsaProvider.listData.length),
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Container(
      //           margin: const EdgeInsets.only(top: 25),
      //           padding: const EdgeInsets.symmetric(vertical: 10),
      //           // height: 124,
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(10),
      //             image: const DecorationImage(
      //               fit: BoxFit.cover,
      //               image: AssetImage(
      //                 'assets/background_card1.png',
      //               ),
      //             ),
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               InkWell(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => const PulsaPaketDataScreen(),
      //                     ),
      //                   );
      //                 },
      //                 child: Column(
      //                   children: [
      //                     Image.asset(
      //                       'assets/pulsa.png',
      //                       height: 90,
      //                       width: 90,
      //                     ),
      //                     // const SizedBox(
      //                     //   height: 10,
      //                     // ),
      //                     Text(
      //                       'Pulsa',
      //                       style: navyTextStyle.copyWith(
      //                         fontSize: 16,
      //                         fontWeight: semiBold,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(
      //                 width: 60,
      //               ),
      //               InkWell(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => const PulsaPaketDataScreen(),
      //                     ),
      //                   );
      //                 },
      //                 child: Column(
      //                   children: [
      //                     Image.asset(
      //                       'assets/paket_data.png',
      //                       height: 90,
      //                       width: 90,
      //                     ),
      //                     // const SizedBox(
      //                     //   height: 10,
      //                     // ),
      //                     Text(
      //                       'Paket Data',
      //                       style: navyTextStyle.copyWith(
      //                         fontSize: 16,
      //                         fontWeight: semiBold,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 8,
      //         ),
      //         Text(
      //           'Rekomendasi Untukmu',
      //           style: whiteTextStyle.copyWith(
      //             fontSize: 16,
      //             fontWeight: semiBold,
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 8,
      //         ),
      //         Container(
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8),
      //             color: whiteColor,
      //           ),
      //           child: Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.symmetric(horizontal: 10),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       'Pulsa',
      //                       style: navyTextStyle.copyWith(
      //                         fontSize: 20,
      //                         fontWeight: semiBold,
      //                       ),
      //                     ),
      //                     TextButton(
      //                       onPressed: () {
      //                         Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                             builder: (context) =>
      //                                 const RekomendasiScreen(),
      //                           ),
      //                         );
      //                       },
      //                       child: Text(
      //                         'Lihat Semua',
      //                         style: yellowTextStyle,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               ListView.separated(
      //                   itemBuilder: (context, index) {
      //                     return Container(
      //                       child: Text(pulsaProvider.listData[index].name!),
      //                     );
      //                   },
      //                   separatorBuilder: (context, index) {
      //                     return Divider();
      //                   },
      //                   itemCount: pulsaProvider.listData.length),
      //               // FutureBuilder(
      //               //     future: pulsaProvider.fetchPulsaData(),
      //               //     builder: (context, snapshot) {
      //               //       return ListView.builder(
      //               //         shrinkWrap: true,
      //               //         itemCount: pulsaProvider.listData.length,
      //               //         primary: false,
      //               //         itemBuilder: (BuildContext context, int index) {
      //               //           final data = pulsaProvider.listData[index];
      //               //           return ListTile(
      //               //             title: Text(data.name!),
      //               //           );
      //               //           // return RekomendasiCard(
      //               //           //   image: data.product_picture!,
      //               //           //   title: data.provider.toString(),
      //               //           //   description: data.provider.toString(),
      //               //           //   price: data.price.toString(),
      //               //           //   date: data.masaAktif.toString(),
      //               //           //   poin: data.rewardPoints.toString(),
      //               //           //   onPressed: () {
      //               //           //     Navigator.push(
      //               //           //       context,
      //               //           //       MaterialPageRoute(
      //               //           //         builder: (context) =>
      //               //           //             const DetailPulsaScreen(),
      //               //           //       ),
      //               //           //     );
      //               //           //   },
      //               //           // );
      //               //         },
      //               //       );
      //               //     }),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //             ],
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 15,
      //         ),
      //         Container(
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8),
      //             color: whiteColor,
      //           ),
      //           child: Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.symmetric(horizontal: 10),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       'Paket Data',
      //                       style: navyTextStyle.copyWith(
      //                         fontSize: 20,
      //                         fontWeight: semiBold,
      //                       ),
      //                     ),
      //                     TextButton(
      //                       onPressed: () {
      //                         Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                             builder: (context) =>
      //                                 const RekomendasiScreen(),
      //                           ),
      //                         );
      //                       },
      //                       child: Text(
      //                         'Lihat Semua',
      //                         style: yellowTextStyle,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               ListView.builder(
      //                 shrinkWrap: true,
      //                 itemCount: 2,
      //                 primary: false,
      //                 itemBuilder: (BuildContext context, int index) {
      //                   return RekomendasiCard(
      //                     image: 'assets/provider_telkomsel.png',
      //                     title: 'Kring-kring',
      //                     description:
      //                         'Teleponan 185 menit sesama telkomsel dan 15 menit ke operator lain',
      //                     price: 'Rp. 50.000',
      //                     date: '30 Hari',
      //                     poin: '5000 Poin',
      //                     onPressed: () {
      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) =>
      //                               const DetailPaketDataScreen(),
      //                         ),
      //                       );
      //                     },
      //                   );
      //                 },
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //             ],
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 15,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
