import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/get_steps_checkout_names.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currPageIndex});

  final int currPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(stepsNames.length, (index) {
        return StepItem(
          index: (index + 1).toString(),
          text: stepsNames[index],
          isActive: index <= currPageIndex,
        );
      }),
    );
  }
}
