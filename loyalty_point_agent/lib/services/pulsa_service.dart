import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/pulsa_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PulsaService {
  final Dio _dio = Dio();

  Future<PulsaModel> getPulsa() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.pulsa,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      return PulsaModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
