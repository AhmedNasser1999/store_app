import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/products/presentation/viewmodels/cubit/products_cubit.dart';
import 'package:store_app/features/products/presentation/viewmodels/cubit/products_state.dart';
import 'package:store_app/features/products/presentation/views/screens/product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store app', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[900],
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF004081)),
            );
          } else if (state is ProductsSuccess) {
            return ProductListScreen(products: state.products);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
