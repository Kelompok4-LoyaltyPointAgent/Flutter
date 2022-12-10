import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_paketdata_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_pulsa_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_rekomendasi.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/card_menu.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/card_rekomendasi_poin.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class PoinScreen extends StatelessWidget {
  const PoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
                    ],
                  );
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                margin: const EdgeInsets.only(top: 17),
                padding: const EdgeInsets.symmetric(
                  horizontal: 47,
                  vertical: 10,
                ),
                // height: 124,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/background_card.png',
                    ),
                  ),
                ),
                child: Wrap(
                  spacing: 80,
                  runSpacing: 20,
                  children: [
                    CardMenu(
                      image: 'assets/pulsa.png',
                      title: 'Pulsa',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PoinRekomendasiScreen(),
                          ),
                        );
                      },
                    ),
                    CardMenu(
                      image: 'assets/paket_data.png',
                      title: 'Paket Data',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PoinRekomendasiScreen(),
                          ),
                        );
                      },
                    ),
                    const CardMenu(
                      image: 'assets/tarik_tunai.png',
                      title: 'Tarik Tunai',
                    ),
                    const CardMenu(
                      image: 'assets/dompet_elektronik.png',
                      title: 'E-Wallet',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 10,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: grayishColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pulsa',
                        style: navyTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PoinRekomendasiScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Lihat Semua',
                          style: navyTextStyle,
                        ),
                      ),
                    ],
                  ),
                  Consumer<PulsaProvider>(
                    builder: (context, provider, _) {
                      switch (provider.myState) {
                        case MyState.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case MyState.loaded:
                          if (provider.data == null) {
                            return const Text('Sorry, your data still empty');
                          } else {
                            return SizedBox(
                              height: 325,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardRekomedasiPoin(
                                    imageProvider:
                                        'assets/provider_telkomsel.png',
                                    image: provider
                                        .data!.data![index].productPicture.url,
                                    voucher: provider.data!.data![index].price
                                        .toString(),
                                    provider:
                                        provider.data!.data![index].provider,
                                    title: provider.data!.data![index].name,
                                    deskripsi:
                                        'Tukarkan poin Anda untuk mendapatkan pulsa ${provider.data!.data![index].price}',
                                    poin:
                                        '${provider.data!.data![index].pricePoints} Poin',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PoinDetailPulsaScreen(
                                            id: index,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }
                        case MyState.failed:
                          return const Text('Ada Masalah');
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paket Data',
                        style: navyTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PoinRekomendasiScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Lihat Semua',
                          style: navyTextStyle,
                        ),
                      ),
                    ],
                  ),
                  Consumer<PaketDataProvider>(
                    builder: (context, provider, _) {
                      switch (provider.myState) {
                        case MyState.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case MyState.loaded:
                          if (provider.data == null) {
                            return const Text('Sorry, your data still empty');
                          } else {
                            return SizedBox(
                              height: 325,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardRekomedasiPoin(
                                    imageProvider:
                                        'assets/provider_telkomsel.png',
                                    image: provider
                                        .data!.data![index].productPicture.url,
                                    voucher:
                                        '${provider.data!.data![index].package.totalInternet} GB',
                                    provider:
                                        provider.data!.data![index].provider,
                                    title: provider.data!.data![index].name,
                                    deskripsi:
                                        provider.data!.data![index].description,
                                    poin:
                                        '${provider.data!.data![index].pricePoints} Poin',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PoinDetailPaketDataScreen(
                                            id: index,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }
                        case MyState.failed:
                          return const Text('Ada Masalah');
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
