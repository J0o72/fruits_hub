import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/home/logic/cart_item/cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit({required this.cartItemEntity}) : super(CartItemInitial());

  final CartItemEntity cartItemEntity;

  void updateCartItem(CartItemEntity cartItem) {
    emit(CartItemUpdated());
  }
}
