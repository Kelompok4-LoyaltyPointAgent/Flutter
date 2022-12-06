import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/user_model.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class KeamananScreen extends StatefulWidget {
  const KeamananScreen({super.key});

  @override
  State<KeamananScreen> createState() => _KeamananScreenState();
}

class _KeamananScreenState extends State<KeamananScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  late ValueNotifier<bool> sekarang;
  late ValueNotifier<bool> baru;
  late ValueNotifier<bool> ulang;
  @override
  void initState() {
    sekarang = ValueNotifier(true);
    baru = ValueNotifier(true);
    ulang = ValueNotifier(true);

    final userProvider = Provider.of<UserProvider>(context, listen: false);

    userProvider.addListener(
      () {
        if (userProvider.myState == MyState.failed) {
          // showModalBottomSheet(
          //   isDismissible: false,
          //   enableDrag: false,
          //   context: context,
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(
          //       top: Radius.circular(20),
          //     ),
          //   ),
          //   builder: (context) => BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //     child: const DialogGagal(),
          //   ),
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Password Salah',
              ),
            ),
          );
        } else if (userProvider.myState == MyState.loaded) {
          // showModalBottomSheet(
          //   isDismissible: false,
          //   enableDrag: false,
          //   context: context,
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(
          //       top: Radius.circular(20),
          //     ),
          //   ),
          //   builder: (context) => BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //     child: const DialogBerhasil(),
          //   ),
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Berhasil Mengganti Password',
              ),
            ),
          );
          Navigator.pop(context);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider auth = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyColor,
        title: Text(
          'Keamanan',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Text(
                'Perbaharui Kata Sandi',
                style: yellowTextStyle.copyWith(
                    fontSize: 18, fontWeight: semiBold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                'Kata sandi digunakan untuk masuk ke akun \nanda dan bertransaksi',
                style: navyTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kata Sandi Saat Ini',
                      style: navyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: sekarang,
                      builder: ((context, value, _) {
                        return TextFormField(
                          controller: oldPassword,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: yellowColor),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Masukkan kata sandi lama Anda',
                            fillColor: whiteColor,
                            filled: true,
                            suffixIcon: IconButton(
                              splashRadius: 20,
                              onPressed: () => sekarang.value = !sekarang.value,
                              icon: Icon(
                                value ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          obscureText: value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Tidak Boleh Kosong';
                            }
                            return null;
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Kata Sandi Baru',
                      style: navyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: baru,
                      builder: ((context, value, _) {
                        return TextFormField(
                          controller: newPassword,
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
                              onPressed: () => baru.value = !baru.value,
                              icon: Icon(
                                value ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          obscureText: value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Tidak Boleh Kosong';
                            }
                            return null;
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Konfirmasi Kata Sandi Baru',
                      style: navyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: ulang,
                      builder: ((context, value, _) {
                        return TextFormField(
                          controller: confirmPassword,
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
                              onPressed: () => ulang.value = !ulang.value,
                              icon: Icon(
                                value ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          obscureText: value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Tidak Boleh Kosong';
                            }
                            return null;
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: yellowColor,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
                          auth.changePassword(
                            UserModel(
                              password: oldPassword.text,
                              newPassword: newPassword.text,
                              confirmPassword: confirmPassword.text,
                            ),
                          );

                          oldPassword.clear();
                          newPassword.clear();
                          confirmPassword.clear();
                        }
                      },
                      child: Consumer<UserProvider>(
                        builder: (context, user, circular) {
                          if (user.myState == MyState.loading) {
                            return circular!;
                          } else {
                            return Text(
                              'Konfirmasi',
                              style: blackRegulerTextStyle.copyWith(
                                  fontWeight: semiBold, fontSize: 16),
                            );
                          }
                        },
                        child: const CircularProgressIndicator(),
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
