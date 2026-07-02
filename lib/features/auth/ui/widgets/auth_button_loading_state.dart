import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class AuthButtonLoadingState extends StatelessWidget {
  const AuthButtonLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.white,
        strokeWidth: 2,
        constraints: BoxConstraints(minWidth: 24, minHeight: 24),
      ),
    );
  }
}
