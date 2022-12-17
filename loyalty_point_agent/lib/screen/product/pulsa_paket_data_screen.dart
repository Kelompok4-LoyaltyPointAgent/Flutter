import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/paket_data_provider.dart';
import 'package:loyalty_point_agent/providers/pulsa_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/product/detail_paket_data_screen.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/idr.dart';
import 'package:loyalty_point_agent/utils/provider_number.dart';
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
  final TextEditingController dropdownController = TextEditingController();

  final List<String> providerItems = [
    'Telkomsel',
    'Indosat',
    'Tri',
    'Axis',
    'Smartfren',
    'XL',
  ];

  List<bool> isSelected = [true, false];
  late bool onTap = false;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<PaketDataProvider>(context, listen: false)
          .fetchFilterPaketData('');
    });
    super.initState();
  }

  String? pro;

  void selectedProvider(val) async {
    await Provider.of<PaketDataProvider>(context, listen: false)
        .fetchFilterPaketData(val.toString());
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
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
              top: 20,
              left: 20,
              right: 20,
            ),
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
                      return 'Mohon Masukkan Nomor Telepon';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Mohon Masukkan Nomor Telepon Yang Benar';
                    } else if (checkprovider(value) != pro) {
                      return 'Mohon Masukkan Nomor Telpon Sesuai Provider';
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
                  onChanged: (value) {
                    pro = value!;
                    selectedProvider(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Silahkan Pilih Provider Kartu Anda';
                    }
                    return null;
                  },
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ToggleButtons(
                              isSelected: isSelected,
                              selectedColor: navyColor,
                              color: navyColor,
                              fillColor: Colors.transparent,
                              textStyle:
                                  navyTextStyle.copyWith(fontWeight: semiBold),
                              borderColor: Colors.transparent,
                              selectedBorderColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 40,
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: isSelected[0]
                                        ? yellowColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: yellowColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text('Semua'),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: isSelected[1]
                                        ? yellowColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: yellowColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Harga'),
                                      isSelected[1]
                                          ? Icon(onTap == false
                                              ? Icons.trending_down
                                              : Icons.trending_up)
                                          : const Icon(Icons.unfold_more),
                                    ],
                                  ),
                                ),
                              ],
                              onPressed: (int newIndex) {
                                setState(() {
                                  for (int index = 0;
                                      index < isSelected.length;
                                      index++) {
                                    if (index == newIndex) {
                                      isSelected[index] = true;
                                    } else {
                                      isSelected[index] = false;
                                    }
                                  }
                                  onTap = onTap == true ? false : true;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: min(52.h, 60.h),
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
                                        if (provider.data!.data == null) {
                                          return const Text(
                                              'Maaf, Data Masih Kosong');
                                        } else if (isSelected[0]) {
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
                                                          .data![index].name
                                                          .toString(),
                                                      style: navyTextStyle
                                                          .copyWith(
                                                              fontWeight: bold),
                                                    ),
                                                    subtitle: Row(
                                                      children: [
                                                        Text(
                                                            '${provider.data!.data![index].credit!.activePeriod} Hari'),
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
                                                      FormatCurrency
                                                          .convertToIdr(
                                                              provider
                                                                  .data!
                                                                  .data![index]
                                                                  .price,
                                                              0),
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
                                                              id: provider
                                                                  .data!
                                                                  .data![index]
                                                                  .id
                                                                  .toString(),
                                                              number:
                                                                  numberController
                                                                      .text,
                                                              mail: userProvider
                                                                  .user!.email!,
                                                              pro: pro!,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              });
                                        } else if (isSelected[1] &&
                                            onTap == false) {
                                          return ListView.builder(
                                              itemCount:
                                                  provider.besar!.data!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  color: grayishColor,
                                                  child: ListTile(
                                                    title: Text(
                                                      provider.besar!
                                                          .data![index].name
                                                          .toString(),
                                                      style: navyTextStyle
                                                          .copyWith(
                                                              fontWeight: bold),
                                                    ),
                                                    subtitle: Row(
                                                      children: [
                                                        Text(
                                                            '${provider.besar!.data![index].credit!.activePeriod} Hari'),
                                                        const Text(' | '),
                                                        Icon(
                                                          Icons.star,
                                                          color: yellowColor,
                                                          size: 15,
                                                        ),
                                                        Text(
                                                            '${provider.besar!.data![index].rewardPoints} Poin'),
                                                      ],
                                                    ),
                                                    trailing: Text(
                                                      FormatCurrency
                                                          .convertToIdr(
                                                              provider
                                                                  .besar!
                                                                  .data![index]
                                                                  .price,
                                                              0),
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
                                                              id: provider
                                                                  .besar!
                                                                  .data![index]
                                                                  .id
                                                                  .toString(),
                                                              number:
                                                                  numberController
                                                                      .text,
                                                              mail: userProvider
                                                                  .user!.email!,
                                                              pro: pro!,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              });
                                        } else if (isSelected[1] &&
                                            onTap == true) {
                                          return ListView.builder(
                                              itemCount:
                                                  provider.kecil!.data!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  color: grayishColor,
                                                  child: ListTile(
                                                    title: Text(
                                                      provider.kecil!
                                                          .data![index].name
                                                          .toString(),
                                                      style: navyTextStyle
                                                          .copyWith(
                                                              fontWeight: bold),
                                                    ),
                                                    subtitle: Row(
                                                      children: [
                                                        Text(
                                                            '${provider.kecil!.data![index].credit!.activePeriod} Hari'),
                                                        const Text(' | '),
                                                        Icon(
                                                          Icons.star,
                                                          color: yellowColor,
                                                          size: 15,
                                                        ),
                                                        Text(
                                                            '${provider.kecil!.data![index].rewardPoints} Poin'),
                                                      ],
                                                    ),
                                                    trailing: Text(
                                                      FormatCurrency
                                                          .convertToIdr(
                                                              provider
                                                                  .kecil!
                                                                  .data![index]
                                                                  .price,
                                                              0),
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
                                                              id: provider
                                                                  .kecil!
                                                                  .data![index]
                                                                  .id
                                                                  .toString(),
                                                              number:
                                                                  numberController
                                                                      .text,
                                                              mail: userProvider
                                                                  .user!.email!,
                                                              pro: pro!,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              });
                                        } else {
                                          return const Text('Ada yang salah');
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
                                    switch (provider.myState2) {
                                      case MyState.loading:
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      case MyState.loaded:
                                        if (provider.filterData!.data == null) {
                                          return const Text(
                                              'Maaf, Data Masih Kosong');
                                        } else if (isSelected[0]) {
                                          return ListView.builder(
                                            itemCount: provider
                                                .filterData!.data!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Card(
                                                color: grayishColor,
                                                child: ListTile(
                                                  title: Text(
                                                    provider.filterData!
                                                        .data![index].name,
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
                                                        '${provider.filterData!.data![index].package.totalInternet} GB',
                                                        style: gbTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    semiBold,
                                                                fontSize: 12),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              '${provider.filterData!.data![index].package.activePeriod} Hari'),
                                                          const Text(' | '),
                                                          Icon(
                                                            Icons.star,
                                                            color: yellowColor,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                              '${provider.filterData!.data![index].rewardPoints} Poin'),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                    FormatCurrency.convertToIdr(
                                                        provider.filterData!
                                                            .data![index].price,
                                                        0),
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
                                                            id: provider
                                                                .filterData!
                                                                .data![index]
                                                                .id,
                                                            number:
                                                                numberController
                                                                    .text,
                                                            mail: userProvider
                                                                .user!.email!,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        } else if (isSelected[1] &&
                                            onTap == false) {
                                          return ListView.builder(
                                            itemCount:
                                                provider.besar!.data!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Card(
                                                color: grayishColor,
                                                child: ListTile(
                                                  title: Text(
                                                    provider.besar!.data![index]
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
                                                        '${provider.besar!.data![index].package.totalInternet} GB',
                                                        style: gbTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    semiBold,
                                                                fontSize: 12),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              '${provider.besar!.data![index].package.activePeriod} Hari'),
                                                          const Text(' | '),
                                                          Icon(
                                                            Icons.star,
                                                            color: yellowColor,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                              '${provider.besar!.data![index].rewardPoints} Poin'),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                    FormatCurrency.convertToIdr(
                                                        provider.besar!
                                                            .data![index].price,
                                                        0),
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
                                                            id: provider
                                                                .besar!
                                                                .data![index]
                                                                .id,
                                                            number:
                                                                numberController
                                                                    .text,
                                                            mail: userProvider
                                                                .user!.email!,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        } else if (isSelected[1] &&
                                            onTap == true) {
                                          return ListView.builder(
                                            itemCount:
                                                provider.kecil!.data!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Card(
                                                color: grayishColor,
                                                child: ListTile(
                                                  title: Text(
                                                    provider.kecil!.data![index]
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
                                                        '${provider.kecil!.data![index].package.totalInternet} GB',
                                                        style: gbTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    semiBold,
                                                                fontSize: 12),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              '${provider.kecil!.data![index].package.activePeriod} Hari'),
                                                          const Text(' | '),
                                                          Icon(
                                                            Icons.star,
                                                            color: yellowColor,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                              '${provider.kecil!.data![index].rewardPoints} Poin'),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                    FormatCurrency.convertToIdr(
                                                        provider.kecil!
                                                            .data![index].price,
                                                        0),
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
                                                            id: provider
                                                                .kecil!
                                                                .data![index]
                                                                .id,
                                                            number:
                                                                numberController
                                                                    .text,
                                                            mail: userProvider
                                                                .user!.email!,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return const Text('salah');
                                        }
                                      case MyState.failed:
                                        return const Text('Belum Ada Data');
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
