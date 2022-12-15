import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/faq_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FaqService {
  final Dio _dio = Dio();

  Future<FaqModel> getFaq() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.faq,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      print(response.data);
      return FaqModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
