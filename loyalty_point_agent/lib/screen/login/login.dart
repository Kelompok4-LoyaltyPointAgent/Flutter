import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/providers/login_provider.dart';
import 'package:loyalty_point_agent/screen/login/widget/dialog_berhasil.dart';
import 'package:loyalty_point_agent/screen/login/widget/dialog_gagal_login.dart';
import 'package:loyalty_point_agent/screen/login/widget/dialog_lupa_password.dart';
import 'package:loyalty_point_agent/screen/register/register.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> passKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late ValueNotifier<bool> isObscure;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.addListener(() {
      if (loginProvider.myState == MyState.failed) {
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
            child: WillPopScope(
              onWillPop: () async => false,
              child: const DialaogGagalLogin(),
            ),
          ),
        );
      } else if (loginProvider.myState == MyState.loaded) {
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
            child: WillPopScope(
              onWillPop: () async => false,
              child: const LoginBerhasil(),
            ),
          ),
        );
      }
    });

    isObscure = ValueNotifier(true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MediaQuery.fromWindow(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 80, bottom: 10),
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
                      'Masuk',
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
                'Silahkan gunakan akun yang sudah \npernah login diaplikasi ini',
                style: navyTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Anda Belum Memiliki Akun ? ',
                    style: navyTextStyle,
                  ),
                  InkWell(
                    child: Text(
                      'Daftar',
                      style: yellowTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const Register();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: 0.0,
                              end: 1.0,
                            );
                            return FadeTransition(
                              opacity: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: navyTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Form(
                    key: emailKey,
                    child: TextFormField(
                      controller: emailController,
                      validator: (String? value) {
                        const String expression = "[a-zA-Z0-9+._%-+]{1,256}"
                            "\\@"
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                            "("
                            "\\."
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
                            ")+";
                        final RegExp regExp = RegExp(expression);
                        return !regExp.hasMatch(value!)
                            ? "Masukkan email yang valid!"
                            : null;
                      },
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
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Kata Sandi',
                    style: navyTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: isObscure,
                    builder: ((context, value, _) {
                      return Form(
                        key: passKey,
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Kata sandi tidak boleh kosong';
                            } else if (value.length < 8) {
                              return 'Kata sandi harus minimal 8 karakter';
                            }
                            return null;
                          },
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
                        ),
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
                    onPressed: () async {
                      if (emailKey.currentState!.validate() &&
                          passKey.currentState!.validate()) {
                        emailKey.currentState!.save();
                        passKey.currentState!.save();
                        Provider.of<LoginProvider>(context, listen: false)
                            .login(
                          LoginModel(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      }
                    },
                    child: Consumer<LoginProvider>(
                      builder: (context, login, circular) {
                        if (login.myState == MyState.loading) {
                          return circular!;
                        } else {
                          return Text(
                            'Masuk',
                            style: blackRegulerTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 16),
                          );
                        }
                      },
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () async {
                        if (emailKey.currentState!.validate()) {
                          emailKey.currentState!.save();

                          // loginProvider.forgotPassword(
                          //   LoginModel(
                          //     email: emailController.text,
                          //   ),
                          // );
                          Provider.of<LoginProvider>(context, listen: false)
                              .forgotPassword(
                                  LoginModel(email: emailController.text));

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
                              child: WillPopScope(
                                onWillPop: () async => false,
                                child: LupaPasswordScreen(
                                  mail: emailController.text,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Lupa Sata Sandi ?',
                        style: yellowTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
