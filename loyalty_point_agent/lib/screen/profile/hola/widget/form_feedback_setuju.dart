import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/providers/checkbox_provider.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class FormFeedBackSetuju extends StatefulWidget {
  const FormFeedBackSetuju({super.key});

  @override
  State<FormFeedBackSetuju> createState() => _FormFeedBackSetujuState();
}

class _FormFeedBackSetujuState extends State<FormFeedBackSetuju> {
  List<Map<String, dynamic>> data = [
    {
      'id': 'Informasi yang diberikan informatif',
      'value': false,
    },
    {
      'id': 'Artikel mudah dipahami',
      'value': false,
    },
    {
      'id': 'Artikel mudah ditemukan',
      'value': false,
    },
    {
      'id': 'Tampilan Menarik',
      'value': false,
    },
  ];

  List<String> selectedCheckbox = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckboxProvider>(
      builder: (context, provider, _) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Apa yang sudah baik ?',
                  style: yellowTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Consumer<CheckboxProvider>(
                  builder: (context, provider, _) {
                    return SizedBox(
                      height: 220,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            title: Text(
                              data[index]['id'].toString(),
                              style: whiteTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 14,
                              ),
                            ),
                            value: data[index]['value'],
                            activeColor: yellowColor,
                            side: BorderSide(color: yellowColor),
                            contentPadding: const EdgeInsets.only(right: 0),
                            onChanged: (value) {
                              provider.changeStatus(value);
                              data[index]['value'] = value;

                              if (data[index]['value'] == true) {
                                selectedCheckbox
                                    .add(data[index]['id'].toString());
                              } else {
                                selectedCheckbox
                                    .remove(data[index]['id'].toString());
                              }
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //controller: nameController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: yellowColor),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Saran (Opsional)',
                    fillColor: whiteColor,
                    filled: true,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const NavBarScreen(),
                      //   ),
                      // );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Kirim Masukan',
                      style: navyTextStyle.copyWith(
                        fontWeight: semiBold,
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
        );
      },
    );
  }
}
