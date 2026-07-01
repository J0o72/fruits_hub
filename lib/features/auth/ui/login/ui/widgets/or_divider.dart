import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.lighterGray)),
        horizontalSpace(12),
        Text('أو', style: TextStyles.font16LightBlackSemiBold),
        horizontalSpace(12),

        Expanded(child: Divider(color: AppColors.lighterGray)),
      ],
    );
  }
}
