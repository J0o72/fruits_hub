import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/get_steps_checkout_names.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/active_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(stepsNames.length, (index) {
        return Expanded(child: ActiveStepItem(stepName: stepsNames[index]));
      }),
    );
  }
}
