import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class SyaratKetentuanPoin extends StatelessWidget {
  const SyaratKetentuanPoin({super.key});

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
            'Tukar Poin Anda dengan cara klik tombol "TUKARKAN" dibawah',
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
            'Periode voucher ini berlangsung dari  3 November - 31 Desember 2022',
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
            'Tiap pelanggan dapat menukarkan Poin sebanyak 1 kali selama periode program dan tidak dapat digabung dengan promosi lainnya',
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
            'Voucher tidak dapat diuangkan atau di-refund',
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
            'Kami berhak melakukan blacklist akun Anda jika ditemukan hal yang melanggar peraturan yang telah diterapkan',
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
