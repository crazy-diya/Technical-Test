import 'package:technical_test/features/data/datasources/remote_datasource.dart';
import 'package:technical_test/features/domain/entities/product_details_entity.dart';
import 'package:technical_test/features/domain/repositories/repository.dart';

import '../../../core/network/network_info.dart';
import '../../../error/exceptions.dart';
import '../../../error/failures.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<ProductDetailsEntity> getProductList() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getProductList();
        return response;
      } on ServerException catch (ex) {
        throw ServerFailure();
      } on APIFailException catch (ex) {
        throw APIFailure();
      } on UnAuthorizedException catch (ex) {
        throw AuthorizedFailure();
      } on DioException catch (e) {
        throw ServerFailure();
      } on Exception {
        throw ServerFailure();
      }
    } else {
      throw ConnectionFailure();
    }
  }
}
