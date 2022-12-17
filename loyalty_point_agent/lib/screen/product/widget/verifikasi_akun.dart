import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/models/transaction_model.dart';
import 'package:loyalty_point_agent/providers/login_provider.dart';
import 'package:loyalty_point_agent/providers/transaction_provider.dart';
import 'package:loyalty_point_agent/providers/user_provider.dart';
import 'package:loyalty_point_agent/screen/product/widget/transaksi_sukses.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class VerifikasiAkun extends StatefulWidget {
  final String number;
  final String mail;
  final String id;
  const VerifikasiAkun(
      {super.key, required this.number, required this.mail, required this.id});

  @override
  State<VerifikasiAkun> createState() => _VerifikasiAkunState();
}

class _VerifikasiAkunState extends State<VerifikasiAkun> {
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late ValueNotifier<bool> isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = ValueNotifier(true);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    final validasiPassword = Provider.of<LoginProvider>(context, listen: false);
    validasiPassword.addListener(() async {
      if (validasiPassword.validasiPassword == MyState.failed) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     backgroundColor: backgroundColor,
        //     content: Text(
        //       'Password salah',
        //       style: whiteTextStyle.copyWith(
        //         fontWeight: semiBold,
        //       ),
        //     ),
        //   ),
        // );
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Password Salah'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('balik'),
              ),
            ],
          ),
        );
      } else if (validasiPassword.validasiPassword == MyState.loaded) {
        await transactionProvider.transaction(
          TransactionModel(
            productId: widget.id,
            number: widget.number,
            email: widget.mail,
            type: 'Purchase',
          ),
        );

        Uri url = Uri.parse(
          transactionProvider.pembelian!.data!.invoiceUrl.toString(),
        );
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }

        Future.delayed(const Duration(seconds: 3), () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: backgroundColor,
                  content: const SingleChildScrollView(
                    child: ProductTransaksiBerhasil(),
                  ),
                ),
              ),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider user = Provider.of<UserProvider>(context, listen: false);
    final LoginProvider checkPassword =
        Provider.of<LoginProvider>(context, listen: false);
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          'assets/logo_utama.png',
          height: 75,
          width: 75,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Verifikasi Akun',
          style: navyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Masukkan kata sandi Anda untuk dapat melanjutkan proses pembayaran',
          style: blackTextStyle.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isObscure,
          builder: ((context, value, _) {
            return Form(
              key: formKey,
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
                    onPressed: () => isObscure.value = !isObscure.value,
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
          height: 20,
        ),
        SizedBox(
          width: 200,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              final isValidForm = formKey.currentState!.validate();
              if (isValidForm) {
                checkPassword.validasiAkun(
                  LoginModel(
                    email: user.user!.email,
                    password: passwordController.text,
                  ),
                );
              }
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
            child: Consumer<LoginProvider>(
              builder: (context, provider, circular) {
                if (provider.validasiPassword == MyState.loading) {
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
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
