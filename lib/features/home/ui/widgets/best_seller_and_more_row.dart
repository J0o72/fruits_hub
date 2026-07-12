import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class BestSellerAndMoreRow extends StatelessWidget {
  const BestSellerAndMoreRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('الأكثر مبيعًا', style: TextStyles.font16LightBlackBold),
        Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.bestSellingScreen);
          },
          child: Text('المزيد', style: TextStyles.font13LightGrayRegular),
        ),
      ],
    );
  }
}
