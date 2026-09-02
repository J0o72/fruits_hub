import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/show_custom_snack_bar.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/home/logic/cart/cart_cubit.dart';
import 'package:fruit_hub/features/home/logic/cart_item/cart_item_cubit.dart';
import 'package:fruit_hub/features/home/logic/cart_item/cart_item_state.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return AppTextButton(
          onPressed: () {},
          text:
              'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنية',
        );
      },
    );
  }
}
