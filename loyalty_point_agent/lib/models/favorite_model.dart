class FavoriteModel {
  String? message;
  List<Data>? data;
  dynamic errors;
  int? status;

  FavoriteModel({this.message, this.data, this.errors, this.status});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    errors = json['errors'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['errors'] = errors;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? userId;
  Product? product;

  Data({this.userId, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    product =
        json['Product'] != null ? Product.fromJson(json['Product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    if (product != null) {
      data['Product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? type;
  String? provider;
  int? price;
  int? pricePoints;
  int? rewardPoints;
  int? stock;
  bool? recommended;
  String? description;
  ProductPicture? productPicture;
  ProductPicture? icon;

  Product(
      {this.id,
      this.name,
      this.type,
      this.provider,
      this.price,
      this.pricePoints,
      this.rewardPoints,
      this.stock,
      this.recommended,
      this.description,
      this.productPicture,
      this.icon});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    provider = json['provider'];
    price = json['price'];
    pricePoints = json['price_points'];
    rewardPoints = json['reward_points'];
    stock = json['stock'];
    recommended = json['recommended'];
    description = json['description'];
    productPicture = json['product_picture'] != null
        ? ProductPicture.fromJson(json['product_picture'])
        : null;
    icon = json['icon'] != null ? ProductPicture.fromJson(json['icon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['provider'] = provider;
    data['price'] = price;
    data['price_points'] = pricePoints;
    data['reward_points'] = rewardPoints;
    data['stock'] = stock;
    data['recommended'] = recommended;
    data['description'] = description;
    if (productPicture != null) {
      data['product_picture'] = productPicture!.toJson();
    }
    if (icon != null) {
      data['icon'] = icon!.toJson();
    }
    return data;
  }
}

class ProductPicture {
  String? id;
  String? name;
  String? url;
  String? type;

  ProductPicture({this.id, this.name, this.url, this.type});

  ProductPicture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}
