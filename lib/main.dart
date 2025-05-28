import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/error/services/services_locator.dart';
import 'package:store_app/features/products/presentation/viewmodels/cubit/products_cubit.dart';
import 'package:store_app/features/products/presentation/views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) {
          final cubit = sl<ProductsCubit>();
          cubit.fetchProducts();
          return cubit;
        },
        child: const HomeScreen(),
      ),
    );
  }
}
