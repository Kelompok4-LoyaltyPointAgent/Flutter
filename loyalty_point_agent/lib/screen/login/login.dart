import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/navbar/navbar.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late ValueNotifier<bool> isObscure;
  @override
  void initState() {
    isObscure = ValueNotifier(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      'Masuk',
                      style: yellowTextStyle.copyWith(
                          fontWeight: bold, fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                'Silahkan gunakan akun yang sudah \npernah login diaplikasi ini',
                style: navyTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Form(
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
                      height: 100,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: yellowColor,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavBarScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Masuk',
                        style: blackRegulerTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
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
