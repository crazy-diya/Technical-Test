import '../entities/product_details_entity.dart';

abstract class Repository{
  Future<ProductDetailsEntity> getProductList();
}