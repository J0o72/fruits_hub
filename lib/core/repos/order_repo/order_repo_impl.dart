import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/error.dart';
import 'package:fruit_hub/core/services/firebase_error_handler.dart';
import 'package:fruit_hub/features/checkout/data/models/order_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DataBaseService dataBaseService;

  OrderRepoImpl(this.dataBaseService);

  @override
  Future<Either<AppError, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      await dataBaseService.addData(
        path: "orders",
        data: OrderModel.fromEntity(orderEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      log(
        "Exception in OrderRepoImplementation.addOrder: ${FirebaseErrorHandler.handleError(e)}",
      );
      return Left(FirebaseErrorHandler.handleError(e));
    }
  }
}
