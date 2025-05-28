import 'package:dartz/dartz.dart';
import 'package:store_app/core/error/exceptions.dart';
import 'package:store_app/core/error/failures.dart';
import 'package:store_app/features/products/data/data_source/products_data_source.dart';
import 'package:store_app/features/products/domain/entites/product.dart';
import 'package:store_app/features/products/domain/repositoris/base_products_repository.dart';

class ProductsRepository extends BaseProductsRepository {
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepository({required this.productsRemoteDataSource});
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final remoteProudcts = await productsRemoteDataSource.getProducts();
      return Right(remoteProudcts);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
