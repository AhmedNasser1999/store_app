import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/features/products/data/data_source/products_data_source.dart';
import 'package:store_app/features/products/data/repositors/products_repository.dart';
import 'package:store_app/features/products/domain/repositoris/base_products_repository.dart';
import 'package:store_app/features/products/domain/use_cases/get_products_usecase.dart';
import 'package:store_app/features/products/presentation/viewmodels/cubit/products_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static Future<void> init() async {
    // Dio
    sl.registerLazySingleton(() => Dio());

    // Register ProductsRemoteDataSource as both interface and concrete
    sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSource(dio: sl()),
    );

    sl.registerLazySingleton<BaseProductsRemoteDataSource>(
      () => sl<ProductsRemoteDataSource>(),
    );

    // Repository
    sl.registerLazySingleton<BaseProductsRepository>(
      () => ProductsRepository(productsRemoteDataSource: sl()),
    );

    // Use case
    sl.registerLazySingleton(
      () => GetProductsUsecase(productsRepository: sl()),
    );

    // Cubit
    sl.registerFactory(() => ProductsCubit(getProductsUsecase: sl()));
  }
}
