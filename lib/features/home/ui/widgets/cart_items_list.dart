import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_item.dart';
import 'package:fruit_hub/features/home/ui/widgets/custom_divider.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,
      itemBuilder: (BuildContext context, int index) {
        return CartItem(cartItemEntity: cartItems[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return CustomDivider();
      },
    );
  }
}
