import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_pemesanan_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class PoinPenukaranScreen extends StatefulWidget {
  const PoinPenukaranScreen({super.key});

  @override
  State<PoinPenukaranScreen> createState() => _PoinPenukaranScreenState();
}

class _PoinPenukaranScreenState extends State<PoinPenukaranScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Detail Hadiah',
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
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
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'Halo Pelajar 58 GB',
                  style: yellowTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Detail Voucher',
                style: navyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
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
                    style: yellowTextStyle,
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
                    style: yellowTextStyle,
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
                    'Internet',
                    style: yellowTextStyle,
                  ),
                  const Spacer(),
                  Text(
                    '58 GB',
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
                    style: yellowTextStyle,
                  ),
                  const Spacer(),
                  Text(
                    '200 Menit',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 5,
                color: greyColor,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: grayishColor,
                ),
                child: Text(
                  'Syarat dan Ketentuan',
                  style: navyTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PoinDetailPemesananScreen(),
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
                    'Tukarkan',
                    style: navyTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
