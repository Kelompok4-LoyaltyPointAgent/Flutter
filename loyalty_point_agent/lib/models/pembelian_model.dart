// To parse this JSON data, do
//
//     final pembelianModel = pembelianModelFromJson(jsonString);

import 'dart:convert';

PembelianModel pembelianModelFromJson(String str) =>
    PembelianModel.fromJson(json.decode(str));

String pembelianModelToJson(PembelianModel data) => json.encode(data.toJson());

class PembelianModel {
  PembelianModel({
    this.message,
    this.data,
    this.errors,
    this.status,
  });

  String? message;
  Data? data;
  dynamic errors;
  int? status;

  factory PembelianModel.fromJson(Map<String, dynamic> json) => PembelianModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        errors: json["errors"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
        "errors": errors,
        "status": status,
      };
}

class Data {
  Data({
    this.id,
    this.userId,
    this.productId,
    this.amount,
    this.method,
    this.status,
    this.type,
    this.invoiceUrl,
    this.transactionDetail,
    this.createdDate,
  });

  String? id;
  String? userId;
  String? productId;
  int? amount;
  String? method;
  String? status;
  String? type;
  String? invoiceUrl;
  TransactionDetail? transactionDetail;
  String? createdDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        amount: json["amount"],
        method: json["method"],
        status: json["status"],
        type: json["type"],
        invoiceUrl: json["invoice_url"],
        transactionDetail:
            TransactionDetail.fromJson(json["transaction_detail"]),
        createdDate: json["created_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "amount": amount,
        "method": method,
        "status": status,
        "type": type,
        "invoice_url": invoiceUrl,
        "transaction_detail": transactionDetail!.toJson(),
        "created_date": createdDate,
      };
}

class TransactionDetail {
  TransactionDetail({
    this.id,
    this.transactionId,
    this.number,
    this.email,
  });

  String? id;
  String? transactionId;
  String? number;
  String? email;

  factory TransactionDetail.fromJson(Map<String, dynamic> json) =>
      TransactionDetail(
        id: json["id"],
        transactionId: json["transaction_id"],
        number: json["number"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "number": number,
        "email": email,
      };
}
