import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/screen/navbar/navbar.dart';
import 'package:loyalty_point_agent/screen/profile/riwayat_transaksi_screen.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifikasiAkun extends StatefulWidget {
  const VerifikasiAkun({super.key});

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
  }

  @override
  Widget build(BuildContext context) {
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
              if (isValidForm) {}
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
              'Konfirmasi',
              style: navyTextStyle.copyWith(
                fontWeight: semiBold,
              ),
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
