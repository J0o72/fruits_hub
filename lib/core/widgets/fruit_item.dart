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
          Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  AppImages.onBoardingImagePageView2,
                  fit: BoxFit.cover,
                ),
              ),

              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    'فراولة',
                    textAlign: TextAlign.right,
                    style: TextStyles.font13LightBlackSemiBold,
                  ),
                ),
                subtitle: Text.rich(
                  textAlign: TextAlign.start,
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
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),

          Positioned(
            top: 5,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/SVGs/favorite_icon.svg',
                width: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
