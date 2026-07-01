import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/app_images.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 20,
        height: 20,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.mainGreen : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6),
            side: BorderSide(
              width: 1.5,
              color: isChecked ? Colors.transparent : AppColors.lightGray,
            ),
          ),
        ),

        child: isChecked
            ? SvgPicture.asset(AppImages.checkIcon)
            : SizedBox.shrink(),
      ),
    );
  }
}
