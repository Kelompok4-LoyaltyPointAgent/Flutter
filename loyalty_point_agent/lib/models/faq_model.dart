// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  FaqModel({
    required this.message,
    required this.data,
    this.errors,
    required this.status,
  });

  String message;
  List<Datum> data;
  dynamic errors;
  int status;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        errors: json["errors"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "errors": errors,
        "status": status,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.category,
    required this.question,
    required this.answer,
  });

  String id;
  String category;
  String question;
  String answer;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "question": question,
        "answer": answer,
      };
}
