import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';

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

      return LoginModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
