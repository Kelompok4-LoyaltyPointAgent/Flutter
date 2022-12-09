// To parse this JSON data, do
//
//     final paketDataModel = paketDataModelFromJson(jsonString);

import 'dart:convert';

PaketDataModel paketDataModelFromJson(String str) =>
    PaketDataModel.fromJson(json.decode(str));

String paketDataModelToJson(PaketDataModel data) => json.encode(data.toJson());

class PaketDataModel {
  PaketDataModel({
    this.message,
    this.data,
    this.errors,
    this.status,
  });

  String? message;
  List<Datum>? data;
  dynamic errors;
  int? status;

  factory PaketDataModel.fromJson(Map<String, dynamic> json) => PaketDataModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        errors: json["errors"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "errors": errors,
        "status": status,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.type,
    required this.provider,
    required this.price,
    required this.pricePoints,
    required this.rewardPoints,
    required this.stock,
    required this.recommended,
    required this.description,
    required this.productPicture,
    required this.icon,
    required this.package,
  });

  String id;
  String name;
  String type;
  String provider;
  int price;
  int pricePoints;
  int rewardPoints;
  int stock;
  bool recommended;
  String description;
  Icon productPicture;
  Icon icon;
  Package package;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        provider: json["provider"],
        price: json["price"],
        pricePoints: json["price_points"],
        rewardPoints: json["reward_points"],
        stock: json["stock"],
        recommended: json["recommended"],
        description: json["description"],
        productPicture: Icon.fromJson(json["product_picture"]),
        icon: Icon.fromJson(json["icon"]),
        package: Package.fromJson(json["package"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "provider": provider,
        "price": price,
        "price_points": pricePoints,
        "reward_points": rewardPoints,
        "stock": stock,
        "recommended": recommended,
        "description": description,
        "product_picture": productPicture.toJson(),
        "icon": icon.toJson(),
        "package": package.toJson(),
      };
}

class Icon {
  Icon({
    required this.id,
    required this.name,
    required this.url,
    required this.type,
  });

  String id;
  String name;
  String url;
  String type;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "type": type,
      };
}

class Package {
  Package({
    required this.id,
    required this.activePeriod,
    required this.totalInternet,
    required this.mainInternet,
    required this.nightInternet,
    required this.socialMedia,
    required this.call,
    required this.sms,
  });

  String id;
  int activePeriod;
  int totalInternet;
  int mainInternet;
  int nightInternet;
  int socialMedia;
  int call;
  int sms;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        activePeriod: json["active_period"],
        totalInternet: json["total_internet"],
        mainInternet: json["main_internet"],
        nightInternet: json["night_internet"],
        socialMedia: json["social_media"],
        call: json["call"],
        sms: json["sms"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active_period": activePeriod,
        "total_internet": totalInternet,
        "main_internet": mainInternet,
        "night_internet": nightInternet,
        "social_media": socialMedia,
        "call": call,
        "sms": sms,
      };
}
