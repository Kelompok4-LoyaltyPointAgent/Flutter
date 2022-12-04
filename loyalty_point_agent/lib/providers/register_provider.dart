import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/register_model.dart';
import 'package:loyalty_point_agent/screen/login/login.dart';
import 'package:loyalty_point_agent/screen/register/widgets/snackbar.dart';
import 'package:loyalty_point_agent/services/register_service.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterService registerService = RegisterService();

  Future register(RegisterModel data, context) async {
    try {
      await registerService.register(data);
      showTextMessage(context, 'Akun Berhasil Dibuat');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    } catch (e) {
      if (e is DioError) {
        showTextMessage(context, e.response!.data['errors'].toString());
      }
    }
  }
}
