import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/products/domain/use_cases/get_products_usecase.dart';
import 'package:store_app/features/products/presentation/viewmodels/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  GetProductsUsecase getProductsUsecase;
  ProductsCubit({required this.getProductsUsecase}) : super(ProductsInitial());
  Future<void> fetchProducts() async {
    emit(ProductsLoading());
    final result = await getProductsUsecase.execute();
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (posts) => emit(ProductsSuccess(posts)),
    );
  }
}
