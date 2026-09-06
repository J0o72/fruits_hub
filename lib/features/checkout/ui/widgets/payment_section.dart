import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/payment_order_summary_widget.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/payment_shipping_addressing_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(24),
        PaymentOrderSummaryWidget(),
        verticalSpace(16),
        PaymentShippingAddressingWidget(),
      ],
    );
  }
}
