import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/services/login_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final LoginService loginService = LoginService();
  SharedPreferences? _prefs;

  LoginModel? result;

  MyState myState = MyState.initial;

  Future login(LoginModel data) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final result = await loginService.login(data);

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

  void deleteToken() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs!.remove('token');
  }
}
