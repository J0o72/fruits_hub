import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/get_steps_checkout_names.dart';
import 'package:fruit_hub/core/functions/show_custom_snack_bar.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currPageIndex,
    required this.pageController,
  });

  final int currPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(stepsNames.length, (index) {
        return GestureDetector(
          onTap: () {
            checkAndNavigateToShippingAddressingPageView(context, index);
          },
          child: StepItem(
            index: (index + 1).toString(),
            text: stepsNames[index],
            isActive: index <= currPageIndex,
          ),
        );
      }),
    );
  }

  void checkAndNavigateToShippingAddressingPageView(
    BuildContext context,
    int index,
  ) {
    if (context.read<OrderEntity>().paymentMethod != null) {
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      showCustomSnackBar(context, 'يرجي تحديد طريقة الدفع');
    }
  }
}
