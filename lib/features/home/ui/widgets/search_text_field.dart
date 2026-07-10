import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.lightBlack,
      style: TextStyles.font16LightBlackSemiBold,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.white, width: 1),
        ),
        hintText: 'ابحث عن.......',
        hintStyle: TextStyles.font13LightGrayRegular,
        prefixIcon: SvgPicture.asset(
          'assets/SVGs/search_icon.svg',
          fit: BoxFit.none,
        ),
        suffixIcon: SvgPicture.asset(
          'assets/SVGs/search_filtering_icon.svg',
          fit: BoxFit.none,
        ),
        fillColor: AppColors.white,
        filled: true,
      ),
    );
  }
}
