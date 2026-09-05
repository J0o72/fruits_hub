import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.mainGreen,
          child: Icon(Icons.check, color: Colors.white),
        ),

        horizontalSpace(4),

        Text('الشحن', style: TextStyles.font13MainGreenBold),
      ],
    );
  }
}
