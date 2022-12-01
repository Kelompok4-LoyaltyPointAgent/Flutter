import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_pulsa_screen.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/poin_rekomendasi_card.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
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
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return PoinRekomendasiCard(
              provider: 'Telkomesel',
              image: 'assets/poin_rekomendasi.png',
              title: 'Halo Pulsa 50.000',
              deskripsi: 'Tukarkan poin Anda untuk mendapatkan pulsa 50.000',
              poin: '2500 poin',
              imageProvider: 'assets/telkomsel.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PoinDetailPulsaScreen(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
