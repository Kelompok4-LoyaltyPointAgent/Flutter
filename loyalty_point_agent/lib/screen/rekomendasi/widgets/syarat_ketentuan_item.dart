import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class SyaratKetentuanItem extends StatelessWidget {
  const SyaratKetentuanItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          minLeadingWidth: 0,
          leading: Text(
            '1.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          title: Text(
            'Harga sudah termasuk PPN.',
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
            'Pelanggan tidak dapat meminta untuk diikutsertakan ke dalam suatu penawaran tertentu.',
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
            'Setelah masa berlaku paket berakhir, maka kuota paket yang tersisa akan hangus.',
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
            'Periode pembelian paket berbatas waktu sesuai dengan ketentuan dari perusahaan provider',
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
            'Kuota Internet dapat digunakan di semua jaringan 2G/3G/4G.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
        ListTile(
          minLeadingWidth: 0,
          leading: Text(
            '6.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          title: Text(
            'Kuota tidak akan terakumulasi dengan paket lainnya.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
        ),
        ListTile(
          minLeadingWidth: 0,
          leading: Text(
            '7.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          title: Text(
            'Pastikan pembelian paket berhasil dengan menerima SMS notifikasi pembelian paket berhasil.',
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
