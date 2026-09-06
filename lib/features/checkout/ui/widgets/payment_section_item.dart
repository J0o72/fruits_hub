import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class PaymentSectionItem extends StatelessWidget {
  const PaymentSectionItem({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.font13LightBlackBold),
        verticalSpace(8),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.lightestGray,
            borderRadius: BorderRadius.circular(5),
          ),
          child: child,
        ),
      ],
    );
  }
}
