import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/favorite_provider.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_paketdata_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_pulsa_screen.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/poin_rekomendasi_card.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<FavoritProvider>(context, listen: false).fetchFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Favorit Anda',
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
      body: Center(
        child: Consumer<FavoritProvider>(
          builder: (context, provider, _) {
            switch (provider.myState) {
              case MyState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case MyState.loaded:
                if (provider.data!.data == null) {
                  return const Text('Belum Ada Data');
                } else {
                  return Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      itemCount: provider.data!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PoinRekomendasiCard(
                          provider: provider
                              .data!.data![index].product!.provider
                              .toString(),
                          image: provider.data!.data![index].product!
                                  .productPicture!.url!.isNotEmpty
                              ? provider.data!.data![index].product!
                                  .productPicture!.url
                                  .toString()
                              : 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
                          title: provider.data!.data![index].product!.name
                              .toString(),
                          deskripsi: provider
                              .data!.data![index].product!.description
                              .toString(),
                          poin: provider.data!.data![index].product!.pricePoints
                              .toString(),
                          imageProvider: provider.data!.data![index].product!
                                  .icon!.url!.isNotEmpty
                              ? provider.data!.data![index].product!.icon!.url
                                  .toString()
                              : 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
                          onTap: () {
                            provider.data!.data![index].product!.type ==
                                    'Credit'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PoinDetailPulsaScreen(
                                        id: index,
                                        pro: provider.data!.data![index]
                                            .product!.provider!,
                                      ),
                                    ),
                                  )
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PoinDetailPaketDataScreen(
                                        id: index,
                                        pro: provider.data!.data![index]
                                            .product!.provider!,
                                      ),
                                    ),
                                  );
                          },
                          onPressed: () async {
                            Provider.of<FavoritProvider>(context, listen: false)
                                .removeFavorite(provider
                                    .data!.data![index].product!.id
                                    .toString());

                            await Future.delayed(Duration.zero, () {
                              Provider.of<FavoritProvider>(context,
                                      listen: false)
                                  .fetchFavorite();
                            });
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
      ),
    );
  }
}
