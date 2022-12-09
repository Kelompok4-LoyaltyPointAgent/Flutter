import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
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
      Provider.of<PulsaProvider>(context, listen: false).fetchPulsa();
    });
    Future.delayed(Duration.zero, () {
      Provider.of<PaketDataProvider>(context, listen: false).fetchPaketData();
    });
  }

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
                      ]);
                }
              case MyState.failed:
                return const Text('Ada Masalah');
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.symmetric(vertical: 10),
                // height: 124,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/background_card1.png',
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PulsaPaketDataScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/pulsa.png',
                            height: 90,
                            width: 90,
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Text(
                            'Pulsa',
                            style: navyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PulsaPaketDataScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/paket_data.png',
                            height: 90,
                            width: 90,
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Text(
                            'Paket Data',
                            style: navyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Rekomendasi Untukmu',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
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
                                      const RekomendasiScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Lihat Semua',
                              style: yellowTextStyle,
                            ),
                          ),
                        ],
                      ),
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
                                child: ListView.builder(
                                  itemCount: 2,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return RekomendasiCard(
                                      image: 'assets/provider_telkomsel.png',
                                      title: provider.data!.data![index].name,
                                      description:
                                          'Teleponan 185 menit sesama telkomsel dan 15 menit ke operator lain',
                                      price:
                                          'Rp. ${provider.data!.data![index].price.toString()}',
                                      date:
                                          '${provider.data!.data![index].credit.activePeriod} Hari',
                                      poin:
                                          '${provider.data!.data![index].pricePoints} Poin',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPulsaScreen(
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
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
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
                                      const RekomendasiScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Lihat Semua',
                              style: yellowTextStyle,
                            ),
                          ),
                        ],
                      ),
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
                                child: ListView.builder(
                                  itemCount: 1,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return RekomendasiCard(
                                      image: 'assets/provider_telkomsel.png',
                                      title: provider.data!.data![index].name,
                                      description: provider.data!.data![index]
                                          .package.description,
                                      price:
                                          'Rp. ${provider.data!.data![index].price.toString()}',
                                      date:
                                          '${provider.data!.data![index].package.activePeriod} Hari',
                                      poin:
                                          '${provider.data!.data![index].pricePoints} Poin',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPaketDataScreen(
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
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
