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

  Data(
      {this.id,
      this.userId,
      this.productId,
      this.product,
      this.amount,
      this.method,
      this.status,
      this.type,
      this.transactionDetail});

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
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? description;
  String? type;
  String? provider;
  int? price;
  int? pricePoints;
  int? rewardPoints;
  int? stock;
  bool? recommended;
  ProductPicture? productPicture;

  Product(
      {this.id,
      this.name,
      this.description,
      this.type,
      this.provider,
      this.price,
      this.pricePoints,
      this.rewardPoints,
      this.stock,
      this.recommended,
      this.productPicture});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    provider = json['provider'];
    price = json['price'];
    pricePoints = json['price_points'];
    rewardPoints = json['reward_points'];
    stock = json['stock'];
    recommended = json['recommended'];
    productPicture = json['product_picture'] != null
        ? ProductPicture.fromJson(json['product_picture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['provider'] = provider;
    data['price'] = price;
    data['price_points'] = pricePoints;
    data['reward_points'] = rewardPoints;
    data['stock'] = stock;
    data['recommended'] = recommended;
    if (productPicture != null) {
      data['product_picture'] = productPicture!.toJson();
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
