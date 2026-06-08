import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/font_weight_helper.dart';

class TextStyles {
  static TextStyle font23LightBlackBold = TextStyle(
    color: AppColors.lightBlack,
    fontSize: 23.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font23MainGreenBold = TextStyle(
    color: AppColors.mainGreen,
    fontSize: 23.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font23SecondaryYelloBold = TextStyle(
    color: AppColors.secondaryYello,
    fontSize: 23.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font13GraySemiBold = TextStyle(
    color: AppColors.gray,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font13LightGrayRegular = TextStyle(
    color: AppColors.gray,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );
}
