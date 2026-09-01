import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_item_buttons.dart';

class CartItemButtonsAndTotalPrice extends StatelessWidget {
  const CartItemButtonsAndTotalPrice({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartItemButtons(cartItemEntity: cartItemEntity),

        Text(
          '${cartItemEntity.calculateTotalPrice()} جنيه ',
          style: TextStyles.font16SecondaryYelloBold,
        ),
      ],
    );
  }
}
