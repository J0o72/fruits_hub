import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(backgroundColor: AppColors.mainGreen),
      ),
    );
  }
}
