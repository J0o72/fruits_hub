import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/app_images.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.lightestGray,
        borderRadius: BorderRadius.circular(4),
      ),

      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/SVGs/favorite_icon.svg',
                width: 22,
              ),
            ),
          ),

          Positioned.fill(
            child: Column(
              children: [
                verticalSpace(17),
                SvgPicture.asset(AppImages.onBoardingImagePageView2),

                ListTile(
                  title: Text(
                    'فراولة',
                    style: TextStyles.font13LightBlackSemiBold,
                  ),

                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '30جنية / ',
                          style: TextStyles.font13SecondaryYelloBold,
                        ),

                        TextSpan(
                          text: 'الكيلو',
                          style: TextStyles.font13SecondaryLightYelloSemiBold,
                        ),
                      ],
                    ),
                  ),

                  trailing: const CircleAvatar(
                    backgroundColor: AppColors.mainGreen,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
