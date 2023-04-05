import 'package:dio/dio.dart';
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
      Response response = await apiHelper.get(AppConstants.url);
      print("FROM RDSI:  ${response}");
      return ProductDetailsEntity.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
}
