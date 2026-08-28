import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/product/product_state.dart';
import 'package:fruit_hub/core/repos/product_repo/product_repo.dart';

class ProductCubit extends Cubit<ProductsState> {
  ProductCubit({required this.productRepo}) : super(ProductsInitial());

  final ProductRepo productRepo;
  int productsNumber = 0;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (error) {
        emit(
          ProductsFailure(
            message:
                error.message ?? 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
          ),
        );
      },
      (products) {
        productsNumber = products.length;
        emit(ProductsSuccess(products));
      },
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());

    var result = await productRepo.getBestSellingProducts();
    result.fold(
      (error) {
        emit(
          ProductsFailure(
            message:
                error.message ?? 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
          ),
        );
      },
      (products) {
        emit(ProductsSuccess(products));
      },
    );
  }
}
