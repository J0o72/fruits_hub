import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/shipping_section_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        ShippingSectionItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40',
          isActiveItem: true,
        ),

        verticalSpace(8),

        ShippingSectionItem(
          title: 'اشتري الان وادفع لاحقا',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '100',
          isActiveItem: false,
        ),
      ],
    );
  }
}
