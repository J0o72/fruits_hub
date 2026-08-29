import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_item_buttons.dart';

class CartItemButtonsAndTotalPrice extends StatelessWidget {
  const CartItemButtonsAndTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartItemButtons(),

        Text('60 جنيه ', style: TextStyles.font16SecondaryYelloBold),
      ],
    );
  }
}
