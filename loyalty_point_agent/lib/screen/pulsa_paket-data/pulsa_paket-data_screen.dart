import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/pulsa_paket-data/widget_pulsa_paket-data.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class PulsaPaketDataScreen extends StatefulWidget {
  const PulsaPaketDataScreen({super.key});

  @override
  State<PulsaPaketDataScreen> createState() => _PulsaPaketDataScreenState();
}

class _PulsaPaketDataScreenState extends State<PulsaPaketDataScreen> {
  final List<String> providerItems = [
    'Telkomsel',
    'Indosat',
  ];

  var provider;

  String? selectedValue;
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
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: yellowColor),
                    ),
                    border: const OutlineInputBorder(),

                    fillColor: whiteColor,
                    filled: true,
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),

                  // isExpanded: true,
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
                  // dropdownDecoration: BoxDecoration(
                  //   // borderRadius: BorderRadius.circular(15),
                  // ),
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
                  child: const WidgetPulsaPaketData(),
                ),
                // Column(
                //   children: [
                //     if (selectedValue == null)
                //       Text('Not Selected')
                //     else
                //       Container(
                //         padding: const EdgeInsets.only(top: 20),
                //         child: const WidgetPulsaPaketData(),
                //       ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
