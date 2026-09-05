import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.lightestGray,
          child: Text('1', style: TextStyles.font13LightBlackSemiBold),
        ),

        horizontalSpace(4),

        Text('الشحن', style: TextStyles.font13lightGraySemiBold),
      ],
    );
  }
}
