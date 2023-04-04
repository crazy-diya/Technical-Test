import 'package:flutter/material.dart';

import '../features/domain/entities/product_details_entity.dart';

class AppConstants {
  static const String appName = 'Shop';

  static List<ProductDetailsEntity> cartList = [];

  static const url =
      "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json";
}
