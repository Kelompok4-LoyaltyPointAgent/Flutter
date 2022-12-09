import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/history_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  // HistoryService() {
  //   _dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) {
  //         return handler.next(options);
  //       },
  //       onResponse: (response, handler) {
  //         return handler.next(response);
  //       },
  //       onError: (DioError e, handler) {
  //         if (e.response!.statusCode == 401) {
  //         } else {}
  //         return handler.next(e);
  //       },
  //     ),
  //   );
  // }
  final Dio _dio = Dio();

  Future<HistoryModel> getHistory() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.history,
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

  // Future<List<HistoryModel>> getAllContacts() async {
  //   SharedPreferences? prefs = await SharedPreferences.getInstance();
  //   String? token;
  //   token = prefs.getString("token");

  //   try {
  //     final response = await _dio.get(
  //       Urls.baseUrl + Urls.history,
  //       options: Options(
  //         headers: {
  //           "Authorization": "Bearer $token",
  //         },
  //       ),
  //     );

  //     // print(response.data);
  //     return List<HistoryModel>.from(response.data
  //         .map((contact) => HistoryModel.fromJson(contact))
  //         .toList());
  //     // return HistoryModel.fromJson(response.data);
  //   } on DioError catch (_) {
  //     rethrow;
  //   }
  // }
}
