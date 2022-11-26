import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/tab_bar_widget.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class PoinRekomendasiScreen extends StatelessWidget {
  const PoinRekomendasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Pulsa dan Paket Data',
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: const TabBarWidget(),
        ),
      ),
    );
  }
}
