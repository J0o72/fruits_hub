import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/error.dart';
import 'package:fruit_hub/core/services/firebase_error_handler.dart';

class ProductRepoImpl implements ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImpl(this.dataBaseService);

  @override
  Future<Either<AppError, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await dataBaseService.getData(path: 'products')
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(products);
    } on Exception catch (e) {
      log(
        "Exception in AuthRepoImplementation.signInWithEmailAndPassword: ${FirebaseErrorHandler.handleError(e)}",
      );
      return left(FirebaseErrorHandler.handleError(e));
    }
  }
}
