import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/favorite_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  final Dio _dio = Dio();

  Future postFavorit(String id) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.favorit,
        data: {"product_id": id},
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      return response.data;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<FavoriteModel> getFavorite() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.favorit,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      // print(response.data);

      return FavoriteModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<FavoriteModel> deleteFavorite(String id) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.delete(
        '${Urls.baseUrl}${Urls.favorit}/$id',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      return response.data;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
