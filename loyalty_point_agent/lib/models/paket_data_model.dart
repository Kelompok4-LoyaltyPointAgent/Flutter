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
    required this.productPicture,
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
  ProductPicture productPicture;
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
        productPicture: ProductPicture.fromJson(json["product_picture"]),
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
        "product_picture": productPicture.toJson(),
        "package": package.toJson(),
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
    required this.description,
    required this.termsOfService,
  });

  String id;
  int activePeriod;
  int totalInternet;
  int mainInternet;
  int nightInternet;
  int socialMedia;
  int call;
  int sms;
  String description;
  String termsOfService;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        activePeriod: json["active_period"],
        totalInternet: json["total_internet"],
        mainInternet: json["main_internet"],
        nightInternet: json["night_internet"],
        socialMedia: json["social_media"],
        call: json["call"],
        sms: json["sms"],
        description: json["description"],
        termsOfService: json["terms_of_service"],
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
        "description": description,
        "terms_of_service": termsOfService,
      };
}

class ProductPicture {
  ProductPicture({
    required this.id,
    required this.name,
    required this.url,
  });

  String id;
  String name;
  String url;

  factory ProductPicture.fromJson(Map<String, dynamic> json) => ProductPicture(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}
