import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';

abstract class CartItemState {}

final class CartItemInitial extends CartItemState {}

final class CartItemUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;

  CartItemUpdated({required this.cartItemEntity});
}
