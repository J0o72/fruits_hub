import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_steps_page_view.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomAppBar(titleText: 'الشحن', hasLeadingIcon: true),
          verticalSpace(16),
          CheckoutSteps(),
          Expanded(child: CheckoutStepsPageView()),

          AppTextButton(text: 'التالي', onPressed: () {}),
        ],
      ),
    );
  }
}
