import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
        SizedBox(
          // width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.65,
          child: Stack(
            children: [
              SvgPicture.asset(backgroundImage),
              Positioned(
                top: 70.h,
                right: 0.w,
                left: 0.w,
                child: SvgPicture.asset(image, fit: BoxFit.none),
              ),
              Text('تخط'),
            ],
          ),
        ),
        SizedBox(height: 25.h),
        title,
        Text(subTitle),
      ],
    );
  }
}
