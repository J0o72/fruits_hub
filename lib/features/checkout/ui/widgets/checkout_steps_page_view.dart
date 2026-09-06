import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/addressing_section.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key, required this.pageController});

  final PageController pageController;

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
}

List<Widget> getPageView() {
  return [ShippingSection(), AddressingSection(), SizedBox()];
}
