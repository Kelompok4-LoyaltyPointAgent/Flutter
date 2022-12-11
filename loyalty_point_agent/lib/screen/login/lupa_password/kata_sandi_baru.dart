import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/login/widget/dialog_berhasil_simpan_kata_sandi.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class KataSandiBaru extends StatefulWidget {
  const KataSandiBaru({super.key});

  @override
  State<KataSandiBaru> createState() => _KataSandiBaruState();
}

class _KataSandiBaruState extends State<KataSandiBaru> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  late ValueNotifier<bool> isObscure;
  @override
  void initState() {
    isObscure = ValueNotifier(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 100, bottom: 10),
                child: Column(
                  children: [
                    const Image(
                      height: 100,
                      image: AssetImage('assets/logo_utama.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Perbarui Kata Sandi',
                      style: yellowTextStyle.copyWith(
                          fontWeight: bold, fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Kata sandi digunakan untuk masuk ke akun \nanda dan bertransaksi',
                style: navyTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 130),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kata Sandi Baru',
                      style: navyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: isObscure,
                      builder: ((context, value, _) {
                        return TextFormField(
                          controller: passwordController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Mohon masukkan password yang benar';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: yellowColor),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Buat kata sandi baru dengan 8 karakter',
                            fillColor: whiteColor,
                            filled: true,
                            suffixIcon: IconButton(
                              splashRadius: 20,
                              onPressed: () =>
                                  isObscure.value = !isObscure.value,
                              icon: Icon(
                                value ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          obscureText: value,
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Konfirmasi Kata Sandi',
                      style: navyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: isObscure,
                      builder: ((context, value, _) {
                        return TextFormField(
                          controller: passwordController,
                          validator: (String? value) {
                            if (value!.isEmpty || value.characters.length < 8) {
                              return 'Mohon masukkan password yang benar';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: yellowColor),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Ulangi kata sandi baru Anda',
                            fillColor: whiteColor,
                            filled: true,
                            suffixIcon: IconButton(
                              splashRadius: 20,
                              onPressed: () =>
                                  isObscure.value = !isObscure.value,
                              icon: Icon(
                                value ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          obscureText: value,
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: yellowColor,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: const BerhasilSimpanKataSandiBaru(),
                          ),
                        );
                      },
                      child: Text(
                        'Konfirmasi',
                        style: blackRegulerTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
