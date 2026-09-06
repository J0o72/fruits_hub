import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class PaymentSectionItem extends StatelessWidget {
  const PaymentSectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ملخص الطلب :', style: TextStyles.font13LightBlackBold),
        verticalSpace(8),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.lightestGray,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'المجموع الفرعي :',
                    style: TextStyles.font13LightGrayRegular,
                  ),
                  Spacer(),
                  Text('150 جنيه', style: TextStyles.font16LightBlackSemiBold),
                ],
              ),
              verticalSpace(8),
              Row(
                children: [
                  Text('التوصيل  :', style: TextStyles.font13LightGrayRegular),
                  Spacer(),
                  Text('150 جنيه', style: TextStyles.font13LightBlackSemiBold),
                ],
              ),
              verticalSpace(8),

              Divider(indent: 25, endIndent: 25),
              verticalSpace(8),
              Row(
                children: [
                  Text('الكلي', style: TextStyles.font16LightBlackBold),
                  Spacer(),

                  Text('300 جنيه', style: TextStyles.font16LightBlackBold),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
