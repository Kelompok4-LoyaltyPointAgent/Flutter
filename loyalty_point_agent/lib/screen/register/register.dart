import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/register_model.dart';
import 'package:loyalty_point_agent/providers/register_provider.dart';
import 'package:loyalty_point_agent/screen/login/login.dart';
import 'package:loyalty_point_agent/screen/register/widgets/dialog_berhasil.dart';
import 'package:loyalty_point_agent/screen/register/widgets/dialog_gagal.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ValueNotifier<bool> isObscure;
  @override
  void initState() {
    final registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);

    registerProvider.addListener(
      () {
        if (registerProvider.myState == MyState.failed) {
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
              child: const DialogGagal(),
            ),
          );
        } else if (registerProvider.myState == MyState.loaded) {
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
              child: const DialogBerhasil(),
            ),
          );
        }
      },
    );

    isObscure = ValueNotifier(true);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RegisterProvider auth =
        Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 100, bottom: 30),
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
                      'Hola Pulsa',
                      style: yellowTextStyle.copyWith(
                          fontWeight: bold, fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Anda Sudah Memiliki Akun ? ',
                    style: navyTextStyle,
                  ),
                  InkWell(
                    child: Text(
                      'Masuk',
                      style: yellowTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  )
                ],
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
                      'Nama Lengkap',
                      style: navyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: yellowColor),
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Ex. Ahmad Krisdiantoro',
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
                      height: 20,
                    ),
                    Text(
                      'Email',
                      style: navyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: yellowColor),
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Ex. example@gmail.com',
                        fillColor: whiteColor,
                        filled: true,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'email tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Kata Sandi',
                      style: navyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: isObscure,
                      builder: ((context, value, _) {
                        return TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: yellowColor),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Ex. Password',
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Kata sandi tidak boleh kosong';
                            } else if (value.length < 8) {
                              return 'Kata sandi harus memiliki 8 karakter';
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
                          auth.register(
                            RegisterModel(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                            context,
                          );

                          nameController.clear();
                          emailController.clear();
                          passwordController.clear();
                        }
                      },
                      child: Consumer<RegisterProvider>(
                        builder: (context, login, circular) {
                          if (login.myState == MyState.loading) {
                            return circular!;
                          } else {
                            return Text(
                              'Daftar',
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
