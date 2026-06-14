import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class SocialMediaLoginWidget extends StatelessWidget {
  const SocialMediaLoginWidget({
    super.key,
    required this.titleText,
    required this.leadingIcon,
  });

  final String titleText;
  final String leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lighterGray),
      ),
      child: ListTile(
        title: Text(
          titleText,
          style: TextStyles.font16LightBlackSemiBold,
          textAlign: TextAlign.center,
        ),
        leading: SvgPicture.asset(leadingIcon),
      ),
    );
  }
}
