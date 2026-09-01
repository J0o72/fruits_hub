import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/home/logic/cart_item/cart_item_cubit.dart';

class CartItemButtons extends StatelessWidget {
  const CartItemButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.mainGreen,
          child: GestureDetector(
            onTap: () {
              cartItemEntity.quantity = cartItemEntity.increaseQuantity();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Text(
            cartItemEntity.quantity.toString(),
            style: TextStyles.font16LightBlackBold,
          ),
        ),

        CircleAvatar(
          backgroundColor: AppColors.lighterGray,
          child: GestureDetector(
            onTap: () {
              cartItemEntity.quantity = cartItemEntity.decreaseQuantity();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
            child: Icon(Icons.remove, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
