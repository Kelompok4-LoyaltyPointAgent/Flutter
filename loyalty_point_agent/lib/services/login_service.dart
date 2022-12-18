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

  Future<UserModel> reqOtp(LoginModel data) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.requestOTP,
        data: data,
      );

      return response.data;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<UserModel> verifyOtp(LoginModel data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.verifyOTP,
        data: data,
      );
      UserModel user = UserModel.fromJson(response.data);
      await prefs.setString("token", response.data['data']["token"]);

      return user;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future changePassword(UserModel data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.put(
        Urls.baseUrl + Urls.resetPassword,
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        prefs.clear();

        return response.data;
      }
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<UserModel> validasiAkun(LoginModel data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.checkPassword,
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      return UserModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
