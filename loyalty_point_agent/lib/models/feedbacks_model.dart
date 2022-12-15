// To parse this JSON data, do
//
//     final feedbacksModel = feedbacksModelFromJson(jsonString);

import 'dart:convert';

FeedbacksModel feedbacksModelFromJson(String str) =>
    FeedbacksModel.fromJson(json.decode(str));

String feedbacksModelToJson(FeedbacksModel data) => json.encode(data.toJson());

class FeedbacksModel {
  FeedbacksModel({
    required this.message,
    required this.data,
    this.errors,
    required this.status,
  });

  String message;
  Data data;
  dynamic errors;
  int status;

  factory FeedbacksModel.fromJson(Map<String, dynamic> json) => FeedbacksModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        errors: json["errors"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "errors": errors,
        "status": status,
      };
}

class Data {
  Data({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.id,
    required this.userId,
    this.user,
    this.isInformationHelpful,
    this.isArticleHelpful,
    this.isArticleEasyToFind,
    this.isDesignGood,
    required this.review,
  });

  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String id;
  String userId;
  dynamic user;
  dynamic isInformationHelpful;
  dynamic isArticleHelpful;
  dynamic isArticleEasyToFind;
  dynamic isDesignGood;
  String review;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        id: json["ID"],
        userId: json["UserID"],
        user: json["User"],
        isInformationHelpful: json["IsInformationHelpful"],
        isArticleHelpful: json["IsArticleHelpful"],
        isArticleEasyToFind: json["IsArticleEasyToFind"],
        isDesignGood: json["IsDesignGood"],
        review: json["Review"],
      );

  Map<String, dynamic> toJson() => {
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "ID": id,
        "UserID": userId,
        "User": user,
        "IsInformationHelpful": isInformationHelpful,
        "IsArticleHelpful": isArticleHelpful,
        "IsArticleEasyToFind": isArticleEasyToFind,
        "IsDesignGood": isDesignGood,
        "Review": review,
      };
}
