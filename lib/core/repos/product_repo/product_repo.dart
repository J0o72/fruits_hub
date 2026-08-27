import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/services/error.dart';

abstract class ProductRepo {
  Future<Either<AppError, List<ProductEntity>>> getProducts();
  Future<Either<AppError, List<ProductEntity>>> getBestSellingProducts();
}
