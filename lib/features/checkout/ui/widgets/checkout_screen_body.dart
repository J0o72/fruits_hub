import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_steps_page_view.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  late PageController pageController;
  int currPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currPageIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomAppBar(
            titleText: getCheckoutAppBarText(currPageIndex),
            hasLeadingIcon: true,
          ),
          verticalSpace(16),
          CheckoutSteps(
            currPageIndex: currPageIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),

          AppTextButton(
            text: getCheckoutButtonText(currPageIndex),
            onPressed: () {
              pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          verticalSpace(50),
        ],
      ),
    );
  }
}

String getCheckoutButtonText(int currentPage) {
  switch (currentPage) {
    case 0:
      return 'التالي';
    case 1:
      return 'التالي';
    case 2:
      return 'الدفع عبر PayPal';

    default:
      return 'التالي';
  }
}

String getCheckoutAppBarText(int currentPage) {
  switch (currentPage) {
    case 0:
      return 'الشحن';
    case 1:
      return 'العنوان';
    case 2:
      return 'الدفع';

    default:
      return '';
  }
}
