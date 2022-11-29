import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:sizer/sizer.dart';

class HolaPulsaScreen extends StatefulWidget {
  const HolaPulsaScreen({super.key});

  @override
  State<HolaPulsaScreen> createState() => _HolaPulsaScreenState();
}

class _HolaPulsaScreenState extends State<HolaPulsaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Hola Pulsa',
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
      body: Stack(
        children: [
          Container(
            height: 40.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                // image: AssetImage('assets/logo_utama.png'),
                image: NetworkImage(
                    'https://p4.wallpaperbetter.com/wallpaper/782/814/396/2d-digital-art-anime-anime-girls-pixiv-hd-wallpaper-preview.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hola Pulsa',
                        style: yellowTextStyle.copyWith(
                            fontSize: 24, fontWeight: bold),
                      ),
                      Text(
                        'Temukan pertanyaan\nuntuk menjawab permasalahan Anda !',
                        style: navyTextStyle.copyWith(fontWeight: semiBold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: yellowColor,
                        child: ListTile(
                          title: Text(
                            'Transaksi berhasil, pulsa belum diterima',
                            style: navyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.add,
                            color: navyColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: yellowColor,
                        child: ListTile(
                          title: Text(
                            'Cara melakukan pembelian produk pulsa yang sama',
                            style: navyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.add,
                            color: navyColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: yellowColor,
                        child: ListTile(
                          title: Text(
                            'Tidak dapat melakukan pembelian pulsa',
                            style: navyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.add,
                            color: navyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
