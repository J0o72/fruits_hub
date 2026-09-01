import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/features/home/logic/cart/cart_cubit.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<CartCubit>().cartEntity.cartItems.isEmpty
        ? SizedBox.shrink()
        : Divider(color: AppColors.lighterGray);
  }
}
