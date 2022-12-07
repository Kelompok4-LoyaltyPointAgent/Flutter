import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/rekomendasi_detail_pemesanan_screen.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/deskripsi_paket_item.dart';
import 'package:loyalty_point_agent/screen/rekomendasi/widgets/syarat_ketentuan_item.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class DetailPaketDataScreen extends StatefulWidget {
  const DetailPaketDataScreen({super.key});

  @override
  State<DetailPaketDataScreen> createState() => _DetailPaketDataScreenState();
}

class _DetailPaketDataScreenState extends State<DetailPaketDataScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Detail Paket Data',
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
      body: Form(
        key: formKey,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nomor Telepon',
                    style: navyTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: yellowColor),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Contoh : 081234567890',
                      fillColor: whiteColor,
                      filled: true,
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 5,
              color: greyColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Halo Pelajar 58 GB',
                      style: navyTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.credit_card_outlined,
                        color: yellowColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Provider',
                        style: blackTextStyle,
                      ),
                      const Spacer(),
                      Text(
                        'Indosat',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: yellowColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Masa Aktif',
                        style: blackTextStyle,
                      ),
                      const Spacer(),
                      Text(
                        '30 Hari',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: yellowColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Internet Utama',
                        style: blackTextStyle,
                      ),
                      const Spacer(),
                      Text(
                        '3 GB',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: yellowColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Internet Malam',
                        style: blackTextStyle,
                      ),
                      const Spacer(),
                      Text(
                        '1 GB',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.list,
                        color: yellowColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Sosial Media',
                        style: blackTextStyle,
                      ),
                      const Spacer(),
                      Text(
                        '0 GB',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        color: yellowColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Telepon',
                        style: blackTextStyle,
                      ),
                      const Spacer(),
                      Text(
                        'Sepuasnya',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: yellowColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'SMS',
                        style: blackTextStyle,
                      ),
                      const Spacer(),
                      Text(
                        'Sepuasnya',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 5,
              color: greyColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: grayishColor,
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Deskripsi Paket',
                        style: navyTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      children: const [
                        DeskripsiPaketItem(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: grayishColor,
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Syarat dan Ketentuan',
                        style: navyTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      children: const [
                        SyaratKetentuanItem(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        //margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total',
                    style: whiteTextStyle,
                  ),
                  Text(
                    '120000',
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RekomendasiDetailPemesananScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: yellowColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Lanjutkan Pemesanan',
                    style: navyTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
