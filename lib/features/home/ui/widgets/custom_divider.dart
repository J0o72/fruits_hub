import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.lighterGray);
  }
}
