import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String backgroundImage;
  final String image;
  final Widget title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SvgPicture.asset(backgroundImage),
            Positioned(
              bottom: 20.h,
              right: 0.w,
              left: 0.w,
              child: SvgPicture.asset(image, fit: BoxFit.scaleDown),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('تخط', style: TextStyles.font13LightGrayRegular),
            ),
          ],
        ),
        SizedBox(height: 25.h),
        title,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              subTitle,
              style: TextStyles.font13GraySemiBold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
