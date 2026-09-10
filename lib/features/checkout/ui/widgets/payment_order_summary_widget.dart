import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/payment_method_constants.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/payment_section_item.dart';
import 'package:provider/provider.dart';

class PaymentOrderSummaryWidget extends StatelessWidget {
  const PaymentOrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentSectionItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.font13LightGrayRegular,
              ),
              Spacer(),
              Text(
                '${(context.read<OrderEntity>().cartItems.calculateTotalPrice())} جنيه',
                style: TextStyles.font16LightBlackSemiBold,
              ),
            ],
          ),
          verticalSpace(8),
          Row(
            children: [
              Text('التوصيل  :', style: TextStyles.font13LightGrayRegular),
              Spacer(),
              context.read<OrderEntity>().paymentMethod ==
                      PaymentMethodConstants.paypal
                  ? Text('0 جنيه', style: TextStyles.font13LightBlackSemiBold)
                  : Text('30 جنيه', style: TextStyles.font13LightBlackSemiBold),
            ],
          ),
          verticalSpace(8),

          Divider(indent: 25, endIndent: 25),
          verticalSpace(8),
          Row(
            children: [
              Text('الكلي', style: TextStyles.font16LightBlackBold),
              Spacer(),

              context.watch<OrderEntity>().paymentMethod ==
                      PaymentMethodConstants.paypal
                  ? Text(
                      '${(context.read<OrderEntity>().cartItems.calculateTotalPrice())} جنيه',
                      style: TextStyles.font16LightBlackBold,
                    )
                  : Text(
                      '${(context.read<OrderEntity>().cartItems.calculateTotalPrice() + 30)} جنيه',
                      style: TextStyles.font16LightBlackBold,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
