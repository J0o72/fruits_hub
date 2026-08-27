import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class ProductsResultAndFilteringBar extends StatelessWidget {
  const ProductsResultAndFilteringBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('0 نتائج', style: TextStyles.font16LightBlackBold),
        Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.bestSellingScreen);
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightWhite,
              borderRadius: BorderRadius.circular(4),
            ),
            width: 44,
            height: 32,
            child: SvgPicture.asset('assets/SVGs/arrow-swap-horizontal.svg'),
          ),
        ),
      ],
    );
  }
}
