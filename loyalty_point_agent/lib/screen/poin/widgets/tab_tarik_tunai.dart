import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/poin/poin_detail_tariktunai_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class TabTarikTunai extends StatefulWidget {
  const TabTarikTunai({super.key});

  @override
  State<TabTarikTunai> createState() => _TabTarikTunaiState();
}

class _TabTarikTunaiState extends State<TabTarikTunai> {
  @override
  Widget build(BuildContext context) {
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
            height: 550,
            child: TabBarView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                  ),
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
                          //controller: nomerController,
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
                              return 'no tidak boleh kosong';
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/BNI.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'BNI',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/BCA.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'BCA',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/mandiri.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Mandiri',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/BRI1.webp',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'BRI',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
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
                          //controller: nomerController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: yellowColor),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Masukan 10 karakter',
                            fillColor: whiteColor,
                            filled: true,
                          ),
                          textInputAction: TextInputAction.next,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PoinDetailTarikTunaiScreen(),
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
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                  ),
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
                          //controller: nomerController,
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
                              return 'no tidak boleh kosong';
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/ovo.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'OVO',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/linkaja.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Link Aja',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/gopay.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Gopay',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/dana.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Dana',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
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
                          //controller: nomerController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: yellowColor),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Masukan 10 karakter',
                            fillColor: whiteColor,
                            filled: true,
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'no telepon tidak boleh kosong';
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
                            onPressed: () {},
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
