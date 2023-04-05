import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:technical_test/core/network/api_helper.dart';
import 'package:technical_test/core/network/network_info.dart';
import 'package:technical_test/features/data/datasources/remote_datasource_impl.dart';
import 'package:technical_test/features/data/repositories/repository_impl.dart';
import 'package:technical_test/features/domain/repositories/repository.dart';
import 'package:technical_test/features/domain/usecases/products_list/get_product_usecase.dart';
import 'package:technical_test/features/presentation/cubit/home/home_cubit.dart';

import '../../features/data/datasources/remote_datasource.dart';

final injection = GetIt.instance;

Future<void> init() async {
  injection.registerSingleton(Dio());

  injection.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      injection.call(),
    ),
  );
  injection.registerLazySingleton(
    () => Connectivity(),
  );
  injection.registerLazySingleton(
    () => APIHelper(
      dio: injection.call(),
    ),
  );

  // Cubits
  injection.registerFactory(
    () => HomeCubit(
      getProductUseCase: injection.call(),
    ),
  );
  // Use Cases
  injection.registerLazySingleton(
    () => GetProductUseCase(
      repository: injection.call(),
    ),
  );
  // Repository
  injection.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: injection.call(),
      networkInfo: injection.call(),
    ),
  );
  // Remote Data Source
  injection.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      apiHelper: injection.call(),
    ),
  );
  // Externals
}
