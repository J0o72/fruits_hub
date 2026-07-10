import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter_svg/svg.dart' hide Svg;
import 'package:fruit_hub/core/helpers/app_images.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/home/ui/widgets/home_banner_button.dart';

class HomeBannerItem extends StatelessWidget {
  const HomeBannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.sizeOf(context).width - 32);
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              right: width * 0.4,
              child: SvgPicture.asset(
                AppImages.onBoardingImagePageView2,
                fit: BoxFit.fill,
              ),
            ),

            Container(
              width: width * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Svg('assets/SVGs/banner_item_background.svg'),
                  fit: BoxFit.fill,
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(25),
                    Text('عروض العيد', style: TextStyles.font13WhiteRegular),
                    Spacer(),
                    Text('خصم 25%', style: TextStyles.font19WhiteBold),
                    verticalSpace(12),
                    HomeBannerButton(),

                    verticalSpace(29),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
