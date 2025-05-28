import 'package:store_app/features/products/data/models/product_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';

abstract class BaseProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductsRemoteDataSource implements BaseProductsRemoteDataSource {
  final Dio dio;
  ProductsRemoteDataSource({required this.dio});
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((product) => ProductModel.fromJson(product))
            .toList();
      }

      throw ServerException(
        'Unexpected response: statusCode=${response.statusCode}, bodyType=${response.data.runtimeType}',
      );
    } catch (e) {
      throw ServerException('Unexpected error: ${e.toString()}');
    }
  }
}
