import 'package:dartz/dartz.dart';
import 'package:store_app/features/products/domain/entites/product.dart';
import '../../../../core/error/failures.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
