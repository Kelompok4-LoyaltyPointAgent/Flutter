import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class DeskripsiPaketItem extends StatelessWidget {
  const DeskripsiPaketItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: false,
          minLeadingWidth: 0,
          leading: Text(
            '1.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          title: Text(
            'Internet Utama akan menjadi prioritas konsumsi pertama bagi pelanggan',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
        ListTile(
          minLeadingWidth: 0,
          leading: Text(
            '2.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          title: Text(
            'Internet malam hanya dapat digunakan pada pukul 00.00 hingga 06.00 WIB',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
        ListTile(
          minLeadingWidth: 0,
          leading: Text(
            '3.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          title: Text(
            'Kuota sosial media akan otomatis dapat digunakan pada aplikasi: WhatsApp, LINE, Facebook, Instagram, YouTube, dan TikTok.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
        ListTile(
          minLeadingWidth: 0,
          leading: Text(
            '4.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          title: Text(
            'Akses internet utama berlaku batas pemakaian wajar. Bila kuota batas pemakaian wajar sudah habis, kecepatan akan disesuaikan menjadi 128 Kbps.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
        ListTile(
          minLeadingWidth: 0,
          leading: Text(
            '5.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          title: Text(
            'Paket telepon dan SMS hanya berlaku untuk sesama provider pembelian',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
