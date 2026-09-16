import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/services/error.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<AppError, void>> addOrder({required OrderEntity orderEntity});
}
