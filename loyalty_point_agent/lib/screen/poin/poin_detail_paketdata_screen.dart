import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/screen/poin/poin_penukaran_paketdata_screen.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class PoinDetailPaketDataScreen extends StatefulWidget {
  final int id;
  const PoinDetailPaketDataScreen({
    super.key,
    required this.id,
  });

  @override
  State<PoinDetailPaketDataScreen> createState() =>
      _PoinDetailPaketDataScreenState();
}

class _PoinDetailPaketDataScreenState extends State<PoinDetailPaketDataScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nomerController = TextEditingController();
  int check = -1;

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
      body: Form(
        key: formKey,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
                    controller: nomerController,
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
                ],
              ),
            ),
            Divider(
              thickness: 5,
              color: greyColor,
            ),
            Consumer<PaketDataProvider>(
              builder: (context, provider, _) {
                switch (provider.myState) {
                  case MyState.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case MyState.loaded:
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              provider.data!.data![widget.id].name,
                              style: navyTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: semiBold,
                              ),
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
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                provider.data!.data![widget.id].provider,
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
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                '${provider.data!.data![widget.id].package.activePeriod} Hari',
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
                                'Internet Utama',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                '${provider.data!.data![widget.id].package.mainInternet} GB',
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
                                'Internet Malam',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                '${provider.data!.data![widget.id].package.nightInternet} GB',
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
                                Icons.list,
                                color: yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Sosial Media',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                '${provider.data!.data![widget.id].package.socialMedia} GB',
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
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                check !=
                                        provider
                                            .data!.data![widget.id].package.call
                                    ? '${provider.data!.data![widget.id].package.call} Menit'
                                    : 'Sepuasnya',
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
                                Icons.email_outlined,
                                color: yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'SMS',
                                style: blackTextStyle,
                              ),
                              const Spacer(),
                              Text(
                                check !=
                                        provider
                                            .data!.data![widget.id].package.sms
                                    ? '${provider.data!.data![widget.id].package.sms} SMS'
                                    : 'Sepuasnya',
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  case MyState.failed:
                    return const Text('Ada Masalah');
                  default:
                    return const SizedBox();
                }
              },
            ),
            Divider(
              thickness: 5,
              color: greyColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: grayishColor,
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Deskripsi Paket',
                        style: navyTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      children: [
                        ListTile(
                          subtitle: Text(
                            '1. Internet Utama akan menjadi prioritas konsumsi pertama bagi pelanggan.\n\n2. Internet malam hanya dapat digunakan pada pukul 00.00 hingga 06.00 WIB.\n\n3. Kuota sosial media akan otomatis dapat digunakan pada aplikasi: WhatsApp, LINE, Facebook, Instagram, YouTube, dan TikTok.\n\n4. Akses internet utama berlaku batas pemakaian wajar. Bila kuota batas pemakaian wajar sudah habis, kecepatan akan disesuaikan menjadi 128 Kbps.\n\n5. Paket telepon dan SMS hanya berlaku untuk sesama provider pembelian',
                            style: blackRegulerTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: grayishColor,
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'Syarat dan Ketentuan',
                        style: navyTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      children: [
                        ListTile(
                          subtitle: Text(
                            '1. Harga sudah termasuk PPN.\n\n2. Pelanggan tidak dapat meminta untuk diikutsertakan ke dalam suatu penawaran tertentu.\n\n3. Setelah masa berlaku paket berakhir, maka kuota paket yang tersisa akan hangus.\n\n4. Periode pembelian paket berbatas waktu sesuai dengan ketentuan dari perusahaan provider.\n\n5. Kuota Internet dapat digunakan di semua jaringan 2G/3G/4G.\n\n6. Kuota tidak akan terakumulasi dengan paket lainnya.\n\n7. Pastikan pembelian paket berhasil dengan menerima SMS notifikasi pembelian paket berhasil.',
                            style: blackRegulerTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semiBold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        //margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Consumer<PaketDataProvider>(builder: (context, provider, _) {
          switch (provider.myState) {
            case MyState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MyState.loaded:
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Poin',
                          style: whiteTextStyle,
                        ),
                        Text(
                          provider.data!.data![widget.id].pricePoints
                              .toString(),
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          final isValidForm = formKey.currentState!.validate();
                          if (isValidForm) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PoinPenukaranPaketDataScreen(
                                  id: widget.id,
                                  nomer: nomerController.text,
                                ),
                              ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: yellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Lanjutkan Pemesanan',
                          style: navyTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            case MyState.failed:
              return const Text('Ada Masalah');
            default:
              return const SizedBox();
          }
        }),
      ),
    );
  }
}
