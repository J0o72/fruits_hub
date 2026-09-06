import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatefulWidget {
  const CheckoutStepsPageView({super.key});

  @override
  State<CheckoutStepsPageView> createState() => _CheckoutStepsPageViewState();
}

class _CheckoutStepsPageViewState extends State<CheckoutStepsPageView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

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
  return [SizedBox(), SizedBox(), SizedBox()];
}
