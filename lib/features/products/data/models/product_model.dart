import 'package:store_app/features/products/domain/entites/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required int id,
    required super.title,
    required super.price,
    required super.description,
    required super.imageUrl,
    required super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final rating = json['rating'] ?? {};
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      imageUrl: json['image'] ?? '',
      rating: (rating['rate'] ?? 0).toDouble(),
    );
  }
}
