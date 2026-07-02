import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.widget,
    required this.onPressed,
  });

  final Widget widget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.mainGreen,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: onPressed,
      child: widget,
    );
  }
}

// Text(text, style: TextStyles.font16WhiteBold)

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
