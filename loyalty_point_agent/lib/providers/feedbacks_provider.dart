import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loyalty_point_agent/models/feedbacks_model.dart';
import 'package:loyalty_point_agent/models/post_feedback_model.dart';
import 'package:loyalty_point_agent/services/feedbacks_service.dart';

class FeedbacksProvider extends ChangeNotifier {
  final FeedbacksService service = FeedbacksService();
  FeedbacksModel? dataFeedback;

  Future feedback(PostFeedbackModel data) async {
    try {
      dataFeedback = await service.postFeedbacks(data);
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }
}
