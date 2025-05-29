import 'package:flutter/material.dart';
import 'package:store_app/features/products/domain/entites/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 200,
      height: 220,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Image.network(product.imageUrl),
                ),
              ),
              SizedBox(height: 10),
              Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Text(
                product.description,
                style: TextStyle(fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 4),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),

              SizedBox(width: 4),
              Row(
                children: [
                  Text(
                    'Review (${product.rating})',
                    style: TextStyle(fontSize: 11),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: Colors.amber, size: 14),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.favorite_border,
                      color: Color(0xff004081),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xff004081),
                    radius: 15,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
