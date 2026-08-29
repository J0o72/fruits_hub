import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class CartItemButtons extends StatelessWidget {
  const CartItemButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.mainGreen,
          child: Icon(Icons.add, color: Colors.white),
        ),

        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Text('3', style: TextStyles.font16LightBlackBold),
        ),

        CircleAvatar(
          backgroundColor: AppColors.lighterGray,
          child: Icon(Icons.remove, color: Colors.grey),
        ),
      ],
    );
  }
}
