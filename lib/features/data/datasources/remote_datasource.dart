import '../../domain/entities/product_details_entity.dart';

abstract class RemoteDataSource{
  Future<ProductDetailsEntity> getProductList();
}