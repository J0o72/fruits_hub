import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_item.dart';
import 'package:fruit_hub/features/home/ui/widgets/custom_divider.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return CartItem();
      },
      separatorBuilder: (BuildContext context, int index) {
        return CustomDivider();
      },
    );
  }
}
