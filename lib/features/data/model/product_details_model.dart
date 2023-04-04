// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    required this.result,
    required this.data,
  });

  String result;
  List<Datum> data;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    result: json["result"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.sku,
    required this.name,
    required this.brandName,
    required this.mainImage,
    required this.price,
    required this.sizes,
    required this.stockStatus,
    required this.colour,
    required this.description,
  });

  String id;
  String sku;
  String name;
  String brandName;
  String mainImage;
  Price price;
  List<String> sizes;
  String stockStatus;
  String colour;
  String description;

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
