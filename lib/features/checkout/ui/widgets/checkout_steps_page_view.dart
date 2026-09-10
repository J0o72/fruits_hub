import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/addressing_section.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/payment_section.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: getPageView().length,
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      itemBuilder: (context, index) {
        return getPageView()[index];
      },
    );
  }

  List<Widget> getPageView() {
    return [
      ShippingSection(),
      AddressingSection(formKey: formKey),
      PaymentSection(),
    ];
  }
}
