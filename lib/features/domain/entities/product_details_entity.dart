// To parse this JSON data, do
//
//     final productDetailsEntity = productDetailsEntityFromJson(jsonString);

import 'dart:convert';

ProductDetailsEntity productDetailsEntityFromJson(String str) =>
    ProductDetailsEntity.fromJson(json.decode(str));

String productDetailsEntityToJson(ProductDetailsEntity data) =>
    json.encode(data.toJson());

class ProductDetailsEntity {
  ProductDetailsEntity({
    required this.result,
    required this.data,
  });

  String result;
  List<Datum> data;

  factory ProductDetailsEntity.fromJson(Map<String, dynamic> json) =>
      ProductDetailsEntity(
        result: json["result"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum(
      {required this.id,
      required this.sku,
      required this.name,
      required this.brandName,
      required this.mainImage,
      required this.price,
      required this.sizes,
      required this.stockStatus,
      required this.colour,
      required this.description,
      this.quantity,
      this.size});

  final String id;
  final String sku;
  final String name;
  final String brandName;
  final String mainImage;
  final Price price;
  final List<String> sizes;
  final String stockStatus;
  final String colour;
  final String description;
  int? quantity;
  String? size;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["SKU"],
        name: json["name"],
        brandName: json["brandName"],
        mainImage: json["mainImage"],
        price: Price.fromJson(json["price"]),
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        stockStatus: json["stockStatus"],
        colour: json["colour"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "SKU": sku,
        "name": name,
        "brandName": brandName,
        "mainImage": mainImage,
        "price": price.toJson(),
        "sizes": List<dynamic>.from(sizes.map((x) => x)),
        "stockStatus": stockStatus,
        "colour": colour,
        "description": description,
      };
}

class Price {
  Price({
    required this.amount,
    required this.currency,
  });

  String amount;
  String currency;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency,
      };
}
