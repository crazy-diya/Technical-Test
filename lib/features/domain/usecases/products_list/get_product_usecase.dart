import 'package:technical_test/features/domain/repositories/repository.dart';

import '../../entities/product_details_entity.dart';

class GetProductUseCase {
  final Repository repository;

  GetProductUseCase({required this.repository});

  Future<ProductDetailsEntity> call() async {
    return await repository.getProductList();
  }
}
