import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/register_model.dart';
import 'package:loyalty_point_agent/models/user_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<UserModel> register(RegisterModel data) async {
    try {
      final res = await _dio.post(
        Urls.baseUrl + Urls.register,
        data: data,
      );
      final user = UserModel.fromJson(res.data);

      return user;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
