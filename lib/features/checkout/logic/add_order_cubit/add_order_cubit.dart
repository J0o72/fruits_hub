import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/logic/add_order_cubit/add_order_state.dart';

class OrderCubit extends Cubit<AddOrderState> {
  OrderCubit({required this.orderRepo}) : super(AddOrderInitial());

  final OrderRepo orderRepo;

  void addOrder({required OrderEntity orderEntity}) async {
    emit(AddOrderLoading());

    var res = await orderRepo.addOrder(orderEntity: orderEntity);

    res.fold(
      (failed) {
        emit(AddOrderFailure(failed.message.toString()));
      },
      (success) {
        emit(AddOrderSuccess());
      },
    );
  }
}
