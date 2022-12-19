class InvoiceModel {
  String? message;
  Data? data;
  dynamic errors;
  int? status;

  InvoiceModel({this.message, this.data, this.errors, this.status});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = errors;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? invoiceUrl;

  Data({this.invoiceUrl});

  Data.fromJson(Map<String, dynamic> json) {
    invoiceUrl = json['invoice_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoice_url'] = invoiceUrl;
    return data;
  }
}
