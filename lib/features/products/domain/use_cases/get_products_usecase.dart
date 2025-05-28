import 'package:dartz/dartz.dart';
import 'package:store_app/core/error/failures.dart';
import 'package:store_app/features/products/domain/entites/product.dart';
import 'package:store_app/features/products/domain/repositoris/base_products_repository.dart';

class GetProductsUsecase {
  final BaseProductsRepository productsRepository;
  GetProductsUsecase({required this.productsRepository});

  Future<Either<Failure, List<Product>>> execute() async {
    return await productsRepository.getProducts();
  }
}
