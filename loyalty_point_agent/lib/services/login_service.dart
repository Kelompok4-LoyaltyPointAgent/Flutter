import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/models/user_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<UserModel> login(LoginModel data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.login,
        data: data,
      );

      UserModel user = UserModel.fromJson(response.data);
      await prefs.setString("token", response.data['data']["token"]);

      return user;
    } on DioError catch (_) {
      rethrow;
    }
  }

  // Future<UserModel> otp(LoginModel data) async {
  //   // SharedPreferences? prefs = await SharedPreferences.getInstance();
  //   try {
  //     final response = await _dio.post(
  //       Urls.baseUrl + Urls.login,
  //       data: data,
  //     );

  //     UserModel user = UserModel.fromJson(response.data);
  //     // await prefs.setString("token", response.data['data']["token"]);

  //     return user;
  //   } on DioError catch (_) {
  //     rethrow;
  //   }
  // }
}
