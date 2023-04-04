import 'package:technical_test/features/data/datasources/remote_datasource.dart';
import 'package:technical_test/features/domain/entities/product_details_entity.dart';
import 'package:technical_test/utils/app_constants.dart';

import '../../../core/network/api_helper.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final APIHelper apiHelper;

  RemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<ProductDetailsEntity> getProductList() async {
    try {
      final response = await apiHelper.get(AppConstants.url);
      return ProductDetailsEntity.fromJson(response);
    } on Exception {
      rethrow;
    }
  }
}
