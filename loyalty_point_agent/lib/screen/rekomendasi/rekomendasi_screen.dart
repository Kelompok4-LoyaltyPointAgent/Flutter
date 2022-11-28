import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/tab_bar_rekomendasi.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class RekomendasiScreen extends StatelessWidget {
  const RekomendasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Rekomendasi untukmu',
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
        child: const TabBarRekomendasi(),
      ),
    );
  }
}
