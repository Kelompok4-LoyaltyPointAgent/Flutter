import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/providers/login_provider.dart';
import 'package:loyalty_point_agent/screen/login/widget/dialog_berhasil_verifikasi.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:loyalty_point_agent/utils/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class ValidasiOTP extends StatefulWidget {
  const ValidasiOTP({super.key, required this.mail});
  final String mail;

  @override
  State<ValidasiOTP> createState() => _ValidasiOTPState();
}

class _ValidasiOTPState extends State<ValidasiOTP> {
  TextEditingController textEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.addListener(() {
      if (loginProvider.validasi == MyState.failed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'OTP Salah',
            ),
          ),
        );
      } else if (loginProvider.validasi == MyState.loaded) {
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
            child: const DialogBerhsilVerifikasi(),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
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
                        'Validasi Akun',
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
                  'Anda mendapatkan kode Verifikasi yang \ndikirimkan baru saja ke gmail\n${widget.mail}',
                  style: navyTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    textStyle: navyTextStyle,
                    // pastedTextStyle: TextStyle(
                    //   color: Colors.green.shade600,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    length: 5,
                    // obscureText: true,
                    // obscuringCharacter: '*',
                    // obscuringWidget: const FlutterLogo(
                    //   size: 24,
                    // ),
                    // blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: nabBarColorUnselected,
                      activeColor: yellowColor,
                      selectedFillColor: nabBarColorUnselected,
                      selectedColor: nabBarColorUnselected,
                      inactiveColor: yellowColor,
                      inactiveFillColor: nabBarColorUnselected,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,

                    // onCompleted: (v) {
                    //   debugPrint("Completed");
                    // },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");

                      return true;
                    },
                    onChanged: (String value) {},
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Tidak menerima kode OTP ?",
                style: yellowTextStyle.copyWith(fontWeight: semiBold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Kirim Ulang",
                  style: gbTextStyle.copyWith(fontWeight: semiBold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: yellowColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () async {
                  Provider.of<LoginProvider>(context, listen: false)
                      .verOTP(LoginModel(
                    email: widget.mail,
                    pin: textEditingController.text,
                  ));
                },
                child: Consumer<LoginProvider>(
                  builder: (context, valid, circular) {
                    if (valid.validasi == MyState.loading) {
                      return circular!;
                    } else {
                      return Text(
                        'Verifikasi',
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
    );
  }
}
