import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/models/user_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      print(response.data['data']);

      return LoginModel.fromJson(response.data['data']);
    } on DioError catch (_) {
      rethrow;
    }
  }

  // Future<UserModel> fetchUsers() async {
  //   final storage = await SharedPreferences.getInstance();
  //   final auth = storage.getString('token');
  //   try {
  //     final response = await _dio.get(Urls.baseUrl + Urls.user,
  //         options: Options(headers: {
  //           "Authorization": "Bearer $auth",
  //         }));

  //     print(auth);
  //     return UserModel.fromJson(response.data['data']);
  //   } on DioError catch (_) {
  //     rethrow;
  //   }
  // }
}
