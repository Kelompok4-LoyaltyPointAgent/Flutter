import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class SyaratKetentuanItem extends StatelessWidget {
  const SyaratKetentuanItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            '1. Harga sudah termasuk PPN.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        ListTile(
          leading: Text(
            '2. Pelanggan tidak dapat meminta untuk diikutsertakan ke dalam suatu penawaran tertentu.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        ListTile(
          leading: Text(
            '3. Setelah masa berlaku paket berakhir, maka kuota paket yang tersisa akan hangus.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        ListTile(
          leading: Text(
            '4. Periode pembelian paket berbatas waktu sesuai dengan ketentuan dari perusahaan provider',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        ListTile(
          leading: Text(
            '5. Kuota Internet dapat digunakan di semua jaringan 2G/3G/4G.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        ListTile(
          leading: Text(
            '6. Kuota tidak akan terakumulasi dengan paket lainnya.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        ListTile(
          leading: Text(
            '7. Pastikan pembelian paket berhasil dengan menerima SMS notifikasi pembelian paket berhasil.',
            style: blackRegulerTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
