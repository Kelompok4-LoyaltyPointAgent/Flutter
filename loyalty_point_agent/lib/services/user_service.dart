import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/user_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final Dio _dio = Dio();

  Future<UserModel> fetchUser() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.user,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      // print(response.data['data']);
      return UserModel.fromJson(response.data['data']);
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
        Urls.baseUrl + Urls.changePassword,
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode != 200) {
        return response.data;
      }
    } on DioError catch (_) {
      rethrow;
    }
  }
}
