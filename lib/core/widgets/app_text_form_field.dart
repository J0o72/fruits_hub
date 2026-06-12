import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

import '../theme/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.isObscureText,
    required this.hintText,
    this.suffixIcon,
    this.focusedBorder,
    this.enabledBorder,
    this.contentPadding,
    this.hintStyle,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  final bool? isObscureText;
  final String hintText;
  final Widget? suffixIcon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      obscureText: isObscureText ?? false,
      style: TextStyles.font16LightBlackSemiBold,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.lightGray, width: 1.3),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.red, width: 1.3),
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font13lightGrayBold,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? AppColors.white,
        filled: true,
      ),
    );
  }
}
