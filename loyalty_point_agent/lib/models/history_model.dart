class HistoryModel {
  String? message;
  List<Data>? data;
  dynamic errors;
  int? status;

  HistoryModel({this.message, this.data, this.errors, this.status});

  HistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? userId;
  String? productId;
  Product? product;
  int? amount;
  String? method;
  String? status;
  String? type;
  TransactionDetail? transactionDetail;
  String? createdDate;

  Data(
      {this.id,
      this.userId,
      this.productId,
      this.product,
      this.amount,
      this.method,
      this.status,
      this.type,
      this.transactionDetail,
      this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    amount = json['amount'];
    method = json['method'];
    status = json['status'];
    type = json['type'];
    transactionDetail = json['transaction_detail'] != null
        ? TransactionDetail.fromJson(json['transaction_detail'])
        : null;
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['amount'] = amount;
    data['method'] = method;
    data['status'] = status;
    data['type'] = type;
    if (transactionDetail != null) {
      data['transaction_detail'] = transactionDetail!.toJson();
    }
    data['created_date'] = createdDate;
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

class TransactionDetail {
  String? id;
  String? transactionId;
  String? number;
  String? email;

  TransactionDetail({this.id, this.transactionId, this.number, this.email});

  TransactionDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    number = json['number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_id'] = transactionId;
    data['number'] = number;
    data['email'] = email;
    return data;
  }
}
