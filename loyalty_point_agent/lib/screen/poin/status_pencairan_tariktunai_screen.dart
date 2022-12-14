import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_point_agent/providers/transaction_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/poin/widgets/transaksi_transfer_berhasil.dart';
import 'package:loyalty_point_agent/utils/idr.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class StatusPencairanTarikTunaiScreen extends StatefulWidget {
  const StatusPencairanTarikTunaiScreen({super.key});

  @override
  State<StatusPencairanTarikTunaiScreen> createState() =>
      _StatusPencairanTarikTunaiScreenState();
}

class _StatusPencairanTarikTunaiScreenState
    extends State<StatusPencairanTarikTunaiScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 10),
      () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: backgroundColor,
                content: const SingleChildScrollView(
                  child: TransaksiTransferBerhasil(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Status Pencairan',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20, bottom: 5),
            child: Text(
              'Rincian Identitas Penerima',
              style: navyTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: ListTile(
              title: Text(
                'Nomer Rekening',
                style: blackTextStyle,
              ),
              trailing: Text(
                transactionProvider.pembelian!.data!.transactionDetail!.number!,
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: ListTile(
              title: Text(
                'Bank',
                style: blackTextStyle,
              ),
              trailing: Text(
                transactionProvider.pembelian!.data!.method!,
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: ListTile(
              title: Text(
                'Atas Nama',
                style: blackTextStyle,
              ),
              trailing: Text(
                user.user!.name.toString(),
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Divider(
            thickness: 5,
            color: greyColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
            child: Text(
              'Status Pencairan',
              style: navyTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: ListTile(
              title: Text(
                'Nominal',
                style: blackTextStyle,
              ),
              trailing: Text(
                FormatCurrency.convertToIdr(
                    transactionProvider.pembelian!.data!.amount, 0),
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: ListTile(
              title: Text(
                'Biaya Admin',
                style: blackTextStyle,
              ),
              trailing: Text(
                FormatCurrency.convertToIdr(0, 0),
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: ListTile(
              title: Text(
                'Tanggal',
                style: blackTextStyle,
              ),
              trailing: Text(
                transactionProvider.pembelian!.data!.createdDate!,
                //DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.now()),
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: ListTile(
              title: Text(
                'Waktu',
                style: blackTextStyle,
              ),
              trailing: Text(
                DateFormat.Hm().format(DateTime.now()),
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_rounded,
                  color: navyColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Permintaan Anda Dalam Proses',
                  style: navyTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
