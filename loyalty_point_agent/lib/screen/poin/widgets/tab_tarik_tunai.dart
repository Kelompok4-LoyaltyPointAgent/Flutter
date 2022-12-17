import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/selected_method_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/poin/data/method.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_ewallet_screen.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_tariktunai_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class TabTarikTunai extends StatefulWidget {
  const TabTarikTunai({super.key});

  @override
  State<TabTarikTunai> createState() => _TabTarikTunaiState();
}

class _TabTarikTunaiState extends State<TabTarikTunai> {
  TextEditingController nominal1Controller = TextEditingController();
  TextEditingController nominal2Controller = TextEditingController();
  TextEditingController nomerRekeningController = TextEditingController();
  TextEditingController nomerTeleponController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String? bankPilihan;
  String? eWalletPilihan;
  @override
  Widget build(BuildContext context) {
    final UserProvider user = Provider.of<UserProvider>(context, listen: false);
    return DefaultTabController(
      length: 2, // length of tabs
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TabBar(
            labelStyle: TextStyle(fontWeight: semiBold),
            labelColor: navyColor,
            unselectedLabelColor: yellowColor,
            indicator: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: whiteColor,
            ),
            indicatorColor: yellowColor,
            tabs: const [
              Tab(
                child: Text(
                  'Tarik Tunai',
                ),
              ),
              Tab(
                child: Text(
                  'Dompet Virtual',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 590,
            child: TabBarView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                  ),
                  child: Form(
                    key: _formKey1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Text(
                            'Nominal Penukaran',
                            style: navyTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: nominal1Controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: yellowColor),
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Contoh 5000',
                              fillColor: whiteColor,
                              filled: true,
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'nominal tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: navyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.warning,
                                    size: 24,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Perhatian !',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '• Minimal penarikan adalah Rp 50.000',
                                style: whiteTextStyle,
                              ),
                              Text(
                                '• Memerlukan 3-5 hari kerja untuk proses penarikan berhasil',
                                style: whiteTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 5,
                          color: yellowColor,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Consumer<SelectedMethodProvider>(
                            builder: (context, provider, _) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: 75,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: bank.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      provider.changeStatus(index);
                                      bankPilihan = bank[index]['nama'];
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 23,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: provider.selectedIndex == index
                                            ? grayishColor
                                            : whiteColor,
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            bank[index]['gambar']!,
                                            height: 40,
                                            width: 40,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            bank[index]['nama']!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Nomor Rekening',
                            style: navyTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: nomerRekeningController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: yellowColor),
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Masukan 10 karakter',
                              fillColor: whiteColor,
                              filled: true,
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'no rekening tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 42,
                            child: ElevatedButton(
                              onPressed: () {
                                final isValidForm =
                                    _formKey1.currentState!.validate();
                                int limit = 50000;
                                int userPoin =
                                    int.parse(user.user!.poin.toString());
                                if (isValidForm) {
                                  if (bankPilihan == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: backgroundColor,
                                        content: Text(
                                          'Method Pembayaran Belum Dipilih',
                                          style: whiteTextStyle.copyWith(
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (limit >
                                      int.parse(nominal1Controller.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: backgroundColor,
                                        content: Text(
                                          'Minimal Penarikan Rp.50.000',
                                          style: whiteTextStyle.copyWith(
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (userPoin <=
                                      int.parse(nominal1Controller.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: backgroundColor,
                                        content: Text(
                                          'Poin Anda Tidak Cukup',
                                          style: whiteTextStyle.copyWith(
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PoinDetailTarikTunaiScreen(
                                          norek: nomerRekeningController.text,
                                          nominal: nominal1Controller.text,
                                          bank: bankPilihan.toString(),
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: yellowColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Selanjutnya',
                                style: navyTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                  ),
                  child: Form(
                    key: _formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Text(
                            'Nominal Penukaran',
                            style: navyTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: nominal2Controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: yellowColor),
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Contoh 5000',
                              fillColor: whiteColor,
                              filled: true,
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'nominal tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: navyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.warning,
                                    size: 24,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Perhatian !',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '• Minimal penarikan adalah Rp 50.000',
                                style: whiteTextStyle,
                              ),
                              Text(
                                '• Memerlukan 15 menit  untuk proses penarikan berhasil',
                                style: whiteTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 5,
                          color: yellowColor,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Consumer<SelectedMethodProvider>(
                            builder: (context, provider, _) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: 75,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: eWallet.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      provider.changeStatus(index);
                                      eWalletPilihan = eWallet[index]['nama'];
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 23,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: provider.selectedIndex == index
                                            ? grayishColor
                                            : whiteColor,
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            eWallet[index]['gambar']!,
                                            height: 40,
                                            width: 40,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            eWallet[index]['nama']!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Nomor Telepon',
                            style: navyTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: nomerTeleponController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: yellowColor),
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'Contoh 08121111111',
                              fillColor: whiteColor,
                              filled: true,
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regExp = RegExp(patttern);
                              if (value!.isEmpty) {
                                return 'Mohon Masukkan Nomor Telepon';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Mohon Masukkan Nomor Telepon Yang Benar';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 42,
                            child: ElevatedButton(
                              onPressed: () {
                                final isValidForm =
                                    _formKey2.currentState!.validate();
                                int limit = 50000;
                                int userPoin =
                                    int.parse(user.user!.poin.toString());
                                if (isValidForm) {
                                  if (eWalletPilihan == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: backgroundColor,
                                        content: Text(
                                          'Method Pembayaran Belum Dipilih',
                                          style: whiteTextStyle.copyWith(
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (limit >
                                      int.parse(nominal2Controller.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: backgroundColor,
                                        content: Text(
                                          'Minimal Penarikan Rp.50.000',
                                          style: whiteTextStyle.copyWith(
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (userPoin <=
                                      int.parse(nominal2Controller.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: backgroundColor,
                                        content: Text(
                                          'Poin Anda Tidak Cukup',
                                          style: whiteTextStyle.copyWith(
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PoinDetailEwalletScreen(
                                          eWallet: eWalletPilihan.toString(),
                                          noTelepon:
                                              nomerTeleponController.text,
                                          nominal: nominal2Controller.text,
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: yellowColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Selanjutnya',
                                style: navyTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
