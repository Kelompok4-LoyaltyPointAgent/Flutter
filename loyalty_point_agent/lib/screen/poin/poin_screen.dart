import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/favorite_provider.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_paketdata_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_pulsa_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_rekomendasi.dart';
import 'package:loyalty_point_agent/screen/poin/poin_tarik_tunai_screen.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/card_menu.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/card_rekomendasi_poin.dart';
import 'package:loyalty_point_agent/screen/profile/pusat_bantuan_screen.dart';
import 'package:loyalty_point_agent/screen/profile/riwayat_transaksi_screen.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/idr.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class PoinScreen extends StatefulWidget {
  const PoinScreen({Key? key}) : super(key: key);

  @override
  State<PoinScreen> createState() => _PoinScreenState();
}

class _PoinScreenState extends State<PoinScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<UserProvider>(context, listen: false).fetchUsersData();
      Provider.of<PulsaProvider>(context, listen: false).fetchPulsa();
      Provider.of<PaketDataProvider>(context, listen: false).fetchPaketData();
      Provider.of<FavoritProvider>(context, listen: false).fetchFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoritProvider>(context).data;
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
                        'Hai, ${provider.user!.name.toString()}!',
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
                            '${provider.user!.poin.toString()} poin',
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RiwayatTransaksiScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.notifications_rounded,
              size: 30,
              color: yellowColor,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PusatBantuanScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.info_rounded,
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
                  horizontal: 55,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardMenu(
                          image: 'assets/pulsa.png',
                          title: 'Pulsa',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PoinRekomendasiScreen(),
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
                                builder: (context) =>
                                    const PoinRekomendasiScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardMenu(
                          image: 'assets/tarik_tunai.png',
                          title: 'Tarik Tunai',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransferScreen(),
                              ),
                            );
                          },
                        ),
                        CardMenu(
                          image: 'assets/dompet_elektronik.png',
                          title: 'E-Wallet',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransferScreen(),
                              ),
                            );
                          },
                        ),
                      ],
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
                          if (provider.data!.data == null) {
                            return const Text('Maaf Data Kosong');
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
                                        provider.data!.data![index].icon!.url,
                                    image: provider
                                        .data!.data![index].productPicture!.url,
                                    voucher: '',
                                    provider:
                                        provider.data!.data![index].provider!,
                                    title: provider.data!.data![index].name!,
                                    deskripsi:
                                        'Tukarkan poin Anda untuk mendapatkan pulsa ${FormatCurrency.convertToIdr(provider.data!.data![index].price, 0)}',
                                    poin:
                                        '${provider.data!.data![index].pricePoints} Poin',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PoinDetailPulsaScreen(id: index),
                                        ),
                                      );
                                    },
                                    onPressed: () async {
                                      if (fav.data == null) {
                                        Provider.of<FavoritProvider>(context,
                                                listen: false)
                                            .sendFavorite(provider
                                                .data!.data![index].id!);
                                      } else {
                                        fav.data!.every((element) =>
                                                element.product!.id !=
                                                provider.data!.data![index].id)
                                            ? Provider.of<FavoritProvider>(
                                                    context,
                                                    listen: false)
                                                .sendFavorite(provider
                                                    .data!.data![index].id!)
                                            : Provider.of<FavoritProvider>(
                                                    context,
                                                    listen: false)
                                                .removeFavorite(provider
                                                    .data!.data![index].id!);
                                      }

                                      await Provider.of<FavoritProvider>(
                                              context,
                                              listen: false)
                                          .fetchFavorite();
                                    },
                                    nyala: fav!.data == null
                                        ? false
                                        : fav.data!.every((element) =>
                                                element.product!.id !=
                                                provider.data!.data![index].id)
                                            ? false
                                            : true,
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
                          if (provider.data!.data == null) {
                            return const Text('Maaf Belum Ada Data');
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
                                        provider.data!.data![index].icon.url,
                                    image: provider
                                        .data!.data![index].productPicture.url,
                                    voucher: '',
                                    provider:
                                        provider.data!.data![index].provider,
                                    title: provider.data!.data![index].name,
                                    deskripsi:
                                        provider.data!.data![index].description,
                                    poin:
                                        '${provider.data!.data![index].pricePoints} Poin',
                                    onTap: () {
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
                                    onPressed: () {
                                      if (fav.data == null) {
                                        Provider.of<FavoritProvider>(context,
                                                listen: false)
                                            .sendFavorite(
                                                provider.data!.data![index].id);
                                      } else {
                                        fav.data!.every((element) =>
                                                element.product!.id !=
                                                provider.data!.data![index].id)
                                            ? Provider.of<FavoritProvider>(
                                                    context,
                                                    listen: false)
                                                .sendFavorite(provider
                                                    .data!.data![index].id)
                                            : Provider.of<FavoritProvider>(
                                                    context,
                                                    listen: false)
                                                .removeFavorite(provider
                                                    .data!.data![index].id);
                                      }
                                      Provider.of<FavoritProvider>(context,
                                              listen: false)
                                          .fetchFavorite();
                                    },
                                    nyala: fav!.data == null
                                        ? false
                                        : fav.data!.every((element) =>
                                                element.product!.id !=
                                                provider.data!.data![index].id)
                                            ? false
                                            : true,
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
