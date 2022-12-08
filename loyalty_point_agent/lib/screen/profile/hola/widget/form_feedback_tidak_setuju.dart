import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class FormFeedBackTidaSetuju extends StatefulWidget {
  const FormFeedBackTidaSetuju({super.key});

  @override
  State<FormFeedBackTidaSetuju> createState() => _FormFeedBackTidaSetujuState();
}

class _FormFeedBackTidaSetujuState extends State<FormFeedBackTidaSetuju> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
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
              'Apa yang kurang baik ?',
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
                'Informasi kurang informatif',
                style: whiteTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 14,
                ),
              ),
              activeColor: yellowColor,
              //checkColor: yellowColor,
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
                'Artikel tidak membantu',
                style: whiteTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 14,
                ),
              ),
              activeColor: yellowColor,
              //checkColor: yellowColor,
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
                'Artikel sulit ditemukan',
                style: whiteTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 14,
                ),
              ),
              activeColor: yellowColor,
              //checkColor: yellowColor,
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
                'Tampilan kurang menarik',
                style: whiteTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 14,
                ),
              ),
              activeColor: yellowColor,
              //checkColor: yellowColor,
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
  }
}
