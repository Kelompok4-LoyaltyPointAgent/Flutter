import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/paket_data_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaketDataService {
  final Dio _dio = Dio();

  Future<PaketDataModel> getPaketData() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.paketData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      // print(response.data);

      return PaketDataModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
