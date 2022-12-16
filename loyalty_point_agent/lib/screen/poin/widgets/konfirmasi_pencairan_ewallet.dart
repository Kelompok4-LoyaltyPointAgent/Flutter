import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/transaction_model.dart';
import 'package:loyalty_point_agent/providers/transaction_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/poin/status_pencairan_ewallet_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class KonfirmasiPencairanEwallet extends StatefulWidget {
  final String noTelepon;
  final String eWallet;
  final String nominal;
  const KonfirmasiPencairanEwallet({
    super.key,
    required this.noTelepon,
    required this.eWallet,
    required this.nominal,
  });

  @override
  State<KonfirmasiPencairanEwallet> createState() =>
      _KonfirmasiPencairanEwalletState();
}

class _KonfirmasiPencairanEwalletState
    extends State<KonfirmasiPencairanEwallet> {
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Column(
      children: [
        Image.asset(
          'assets/konfirmasi.png',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Konfirmasi Pencairan',
          style: yellowTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Apakah anda yakin ingin melakukan pencairan dana ?',
          style: whiteTextStyle.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 110,
              height: 42,
              child: ElevatedButton(
                onPressed: () async {
                  await transactionProvider.transaction(
                    TransactionModel(
                      amount: int.parse(widget.nominal),
                      number: widget.noTelepon,
                      email: userProvider.user!.email,
                      method: widget.eWallet,
                      type: 'Cashout',
                    ),
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const StatusPencairanEwalletScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: yellowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Ya',
                  style: navyTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 110,
              height: 42,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Tidak',
                  style: navyTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
