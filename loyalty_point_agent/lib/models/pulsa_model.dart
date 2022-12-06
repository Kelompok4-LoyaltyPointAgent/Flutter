class PulsaModel {
  final String? id;
  final String? name;
  final String? provider;
  final int? price;
  final int? pricePoints;
  final String? product_picture;

  PulsaModel({
    this.id,
    this.name,
    this.provider,
    this.price,
    this.pricePoints,
    this.product_picture,
  });

  factory PulsaModel.fromJson(Map<String, dynamic> json) => PulsaModel(
      id: json['id'],
      name: json['name'],
      provider: json['provider'],
      price: json['price'],
      pricePoints: json['price_points'],
      product_picture: json['product_picure']);
}
