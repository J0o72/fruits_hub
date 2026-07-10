import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/app_images.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            top: 5,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SvgPicture.asset(
                  AppImages.onBoardingImagePageView2,
                  width: 180,
                  height: 180,
                ),

                ListTile(
                  title: Text(
                    'فراولة',
                    textAlign: TextAlign.right,
                    style: TextStyles.font13LightBlackSemiBold,
                  ),
                  subtitle: Text.rich(
                    textAlign: TextAlign.right,
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
