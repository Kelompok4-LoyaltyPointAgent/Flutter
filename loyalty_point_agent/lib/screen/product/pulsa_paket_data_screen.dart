import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/screen/product/detail_paket_data_screen.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'detail_pemesanan_pulsa.dart';

class PulsaPaketDataScreen extends StatefulWidget {
  const PulsaPaketDataScreen({super.key});

  @override
  State<PulsaPaketDataScreen> createState() => _PulsaPaketDataScreenState();
}

class _PulsaPaketDataScreenState extends State<PulsaPaketDataScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();

  final List<String> providerItems = [
    'Telkomsel',
    'Indosat',
    'Tri',
    'Axis',
    'Smartfren',
    'XL',
  ];

  String? selectedValue;

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //     Duration.zero,
  //     () {
  //       Provider.of<PaketDataProvider>(context, listen: false).fetchPaketData();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Pulsa dan Paket Data',
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 20, right: 20, bottom: 130),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nomor Telepon',
                  style: navyTextStyle.copyWith(fontWeight: semiBold),
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
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  validator: (value) {
                    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = RegExp(patttern);
                    if (value!.isEmpty) {
                      return 'Please enter mobile number';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: yellowColor),
                    ),
                    border: const OutlineInputBorder(),
                    fillColor: whiteColor,
                    filled: true,
                  ),
                  hint: const Text(
                    'Pilih Provider Kartu Anda',
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: navyColor,
                    ),
                  ),
                  iconSize: 40,
                  buttonHeight: 60,
                  items: providerItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: navyTextStyle.copyWith(fontWeight: medium),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TabBar(
                          indicatorColor: yellowColor,
                          tabs: [
                            Tab(
                              child: Text(
                                'Pulsa',
                                style: navyTextStyle.copyWith(
                                    fontWeight: semiBold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Paket Data',
                                style: navyTextStyle.copyWith(
                                    fontWeight: semiBold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                          child: TabBarView(
                            children: <Widget>[
                              Center(
                                child: Consumer<PulsaProvider>(
                                  builder: (context, provider, index) {
                                    switch (provider.myState) {
                                      case MyState.loading:
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      case MyState.loaded:
                                        if (provider.data == null) {
                                          return const Text('Kosong');
                                        } else {
                                          return ListView.builder(
                                              itemCount:
                                                  provider.data!.data!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  color: grayishColor,
                                                  child: ListTile(
                                                    title: Text(
                                                      provider.data!
                                                          .data![index].name,
                                                      style: navyTextStyle
                                                          .copyWith(
                                                              fontWeight: bold),
                                                    ),
                                                    subtitle: Row(
                                                      children: [
                                                        Text(
                                                            '${provider.data!.data![index].credit.activePeriod} Hari'),
                                                        const Text(' | '),
                                                        Icon(
                                                          Icons.star,
                                                          color: yellowColor,
                                                          size: 15,
                                                        ),
                                                        Text(
                                                            '${provider.data!.data![index].rewardPoints} Poin'),
                                                      ],
                                                    ),
                                                    trailing: Text(
                                                      'Rp. ${provider.data!.data![index].price}',
                                                      style: yellowTextStyle
                                                          .copyWith(
                                                              fontWeight: bold,
                                                              fontSize: 18),
                                                    ),
                                                    onTap: () {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailPemesananPulsaScreen(
                                                              id: index,
                                                              number:
                                                                  numberController
                                                                      .text,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              });
                                        }
                                      case MyState.failed:
                                        return const Text('Ada Masalah');

                                      default:
                                        return const SizedBox();
                                    }
                                  },
                                ),
                              ),
                              Center(
                                child: Consumer<PaketDataProvider>(
                                  builder: (context, provider, index) {
                                    switch (provider.myState) {
                                      case MyState.loading:
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      case MyState.loaded:
                                        if (provider.data == null) {
                                          return const Text(
                                              'Sorry, your data still empty');
                                        } else {
                                          return ListView.builder(
                                            itemCount:
                                                provider.data!.data!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Card(
                                                color: grayishColor,
                                                child: ListTile(
                                                  title: Text(
                                                    provider.data!.data![index]
                                                        .name,
                                                    style:
                                                        navyTextStyle.copyWith(
                                                            fontWeight: bold),
                                                  ),
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${provider.data!.data![index].package.totalInternet} GB',
                                                        style: gbTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    semiBold,
                                                                fontSize: 12),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              '${provider.data!.data![index].package.activePeriod} Hari'),
                                                          const Text(' | '),
                                                          Icon(
                                                            Icons.star,
                                                            color: yellowColor,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                              '${provider.data!.data![index].rewardPoints} Poin'),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                    'Rp. ${provider.data!.data![index].price}',
                                                    style: yellowTextStyle
                                                        .copyWith(
                                                            fontWeight: bold,
                                                            fontSize: 16),
                                                  ),
                                                  onTap: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductDetailPaketDataScreen(
                                                            id: index,
                                                            number:
                                                                numberController
                                                                    .text,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      case MyState.failed:
                                        return const Text('Ada Masalah');
                                      default:
                                        return const SizedBox();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // child: WidgetPulsaPaketData(
                  //   number: numberController.text,
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
