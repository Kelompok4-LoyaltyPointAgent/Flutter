import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/feedbacks_model.dart';
import 'package:loyalty_point_agent/models/post_feedback_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbacksService {
  final Dio _dio = Dio();

  Future<FeedbacksModel> postFeedbacks(PostFeedbackModel data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final res = await _dio.post(
        Urls.baseUrl + Urls.feedbacks,
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      final dataPost = FeedbacksModel.fromJson(res.data);
      return dataPost;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
