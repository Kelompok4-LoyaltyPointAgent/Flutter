import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/services/login_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class LoginProvider extends ChangeNotifier {
  final LoginService loginService = LoginService();

  LoginModel? result;

  MyState myState = MyState.initial;

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final result = await loginService.login(
        email: email,
        password: password,
      );

      myState = MyState.loaded;
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
