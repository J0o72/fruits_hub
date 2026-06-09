import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.isVisibility,
  });
  final String backgroundImage;
  final String image;
  final Widget title;
  final String subTitle;
  final bool isVisibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
            ),
            Positioned(
              bottom: 20.h,
              right: 0.w,
              left: 0.w,
              child: SvgPicture.asset(image, fit: BoxFit.scaleDown),
            ),
            Visibility(
              visible: isVisibility,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.loginScreen);
                  },
                  child: Text('تخط', style: TextStyles.font13LightGrayRegular),
                ),
              ),
            ),
          ],
        ),
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
