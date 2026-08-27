import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class HomeBannerButton extends StatelessWidget {
  const HomeBannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(4),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FittedBox(
            child: Text('تسوق الان', style: TextStyles.font13MainGreenBold),
          ),
        ),
      ),
    );
  }
}
