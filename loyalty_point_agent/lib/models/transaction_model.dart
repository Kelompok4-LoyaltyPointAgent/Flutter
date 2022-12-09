class TransactionModel {
  String? productId;
  String? userId;
  int? amount;
  String? method;
  String? number;
  String? email;
  String? status;
  String? type;

  TransactionModel(
      {this.productId,
      this.userId,
      this.amount,
      this.method,
      this.number,
      this.email,
      this.status,
      this.type});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    userId = json['user_id'];
    amount = json['amount'];
    method = json['method'];
    number = json['number'];
    email = json['email'];
    status = json['status'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['method'] = method;
    data['number'] = number;
    data['email'] = email;
    data['status'] = status;
    data['type'] = type;
    return data;
  }
}
