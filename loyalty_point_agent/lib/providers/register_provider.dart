import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/models/register_model.dart';
import 'package:loyalty_point_agent/services/register_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterService registerService = RegisterService();

  MyState myState = MyState.initial;

  Future register(RegisterModel data, context) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final result = await registerService.register(data);

      myState = MyState.loaded;
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        myState = MyState.failed;
        notifyListeners();
      }
    }
  }
}
