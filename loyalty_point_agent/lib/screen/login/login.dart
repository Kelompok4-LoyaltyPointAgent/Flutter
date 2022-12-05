import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/providers/login_provider.dart';
import 'package:loyalty_point_agent/screen/navbar/navbar.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late ValueNotifier<bool> isObscure;
  @override
  void initState() {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.addListener(() {
      if (loginProvider.myState == MyState.failed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Email atau Kata Sandi Salah.',
            ),
          ),
        );
      } else if (loginProvider.myState == MyState.loaded) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Berhasil Masuk',
            ),
          ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const NavBarScreen(),
          ),
          (route) => false,
        );
      }
    });

    isObscure = ValueNotifier(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
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
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                  )
                ],
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
                      'Email',
                      style: navyTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    TextFormField(
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
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          await loginProvider.login(
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
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Lupa Sata Sandi ?',
                          style: yellowTextStyle.copyWith(fontWeight: semiBold),
                        ),
                      ),
                    )
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
