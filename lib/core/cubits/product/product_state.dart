import 'package:fruit_hub/core/entities/product_entity.dart';

abstract class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsFailure extends ProductsState {
  final String message;
  ProductsFailure({required this.message});
}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;

  ProductsSuccess(this.products);
}
