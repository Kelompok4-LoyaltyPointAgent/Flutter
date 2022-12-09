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
      'id': 'Coding',
      'value': false,
    },
    {
      'id': 'Game',
      'value': false,
    },
    {
      'id': 'Study',
      'value': false,
    },
  ];

  List<String> selectedCheckbox = [];

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckboxProvider>(builder: (context, provider, _) {
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
              CheckboxListTile(
                title: Text(
                  'Informasi yang diberikan informatif',
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 14,
                  ),
                ),
                activeColor: yellowColor,
                
                value: provider.status,
                side: BorderSide(color: yellowColor),
                // ignore: avoid_types_as_parameter_names
                onChanged: (value) {
                  provider.changeStatus();
                },
              ),
              Divider(
                thickness: 1,
                color: whiteColor,
              ),
              CheckboxListTile(
                title: Text(
                  'Artikel mudah dipahami',
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 14,
                  ),
                ),
                activeColor: yellowColor,
                side: BorderSide(color: yellowColor),
                value: provider.status,
                onChanged: (bool) {
                  provider.changeStatus();
                },
              ),
              Divider(
                thickness: 1,
                color: whiteColor,
              ),
              CheckboxListTile(
                title: Text(
                  'Artikel mudah ditemukan',
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 14,
                  ),
                ),
                activeColor: yellowColor,
                side: BorderSide(color: yellowColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Divider(
                thickness: 1,
                color: whiteColor,
              ),
              CheckboxListTile(
                title: Text(
                  'Tampilan menarik',
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 14,
                  ),
                ),
                activeColor: yellowColor,
                side: BorderSide(
                  color: yellowColor,
                ),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Divider(
                thickness: 1,
                color: whiteColor,
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
    });
  }
}
