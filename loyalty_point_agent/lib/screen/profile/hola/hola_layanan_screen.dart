import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:sizer/sizer.dart';

class HolaLayananScreen extends StatefulWidget {
  const HolaLayananScreen({super.key});

  @override
  State<HolaLayananScreen> createState() => _HolaLayananScreenState();
}

class _HolaLayananScreenState extends State<HolaLayananScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Hola Layanan',
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
                    'https://nawalakarsa.id/wp-content/uploads/2022/02/Screenshotter-YouTube-TVPV-026-e1644159913925.jpg'),
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
                        'Hola Layanan',
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
                            'Kendala login pada aplikasi Hola Pulsa',
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
                            'Melakukan perbaruan kata sandi pada Aplikasi Hola Pulsa',
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
                            'Kerja sama mitra dengan Hola Pulsa',
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
