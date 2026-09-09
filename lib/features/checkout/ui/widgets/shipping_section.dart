import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/shipping_section_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        ShippingSectionItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: context
              .read<OrderEntity>()
              .cartItems
              .calculateTotalPrice()
              .toString(),
          isActiveItem: selectedIndex == 0,
          onTap: () {
            selectedIndex = 0;
            setState(() {});
          },
        ),

        verticalSpace(8),

        ShippingSectionItem(
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price:
              (context.read<OrderEntity>().cartItems.calculateTotalPrice() + 30)
                  .toString(),
          isActiveItem: selectedIndex == 1,
          onTap: () {
            selectedIndex = 1;
            setState(() {});
          },
        ),
      ],
    );
  }
}
