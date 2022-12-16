import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/history_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  final Dio _dio = Dio();

  Future<HistoryModel> getHistory() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.transaction,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      return HistoryModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
