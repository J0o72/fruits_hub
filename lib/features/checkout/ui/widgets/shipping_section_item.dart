import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/shipping_item_active_dot.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/shipping_item_in_active_dot.dart';

class ShippingSectionItem extends StatelessWidget {
  const ShippingSectionItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isActiveItem,
    required this.onTap,
  });

  final String title, subTitle, price;
  final bool isActiveItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicHeight(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.only(
            top: 16,
            left: 13,
            right: 28,
            bottom: 16,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x33D9D9D9),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isActiveItem ? AppColors.mainGreen : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isActiveItem
                  ? ActiveShippingItemDot()
                  : InActiveShippingItemDot(),

              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.font13LightBlackSemiBold),
                  verticalSpace(10),
                  Text(subTitle, style: TextStyles.font13LightGrayRegular),
                ],
              ),

              Spacer(),
              Center(
                child: Text(
                  '$price جنيه',
                  style: TextStyles.font13MainGreenBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
