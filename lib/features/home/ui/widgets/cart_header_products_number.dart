import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/home/logic/cart/cart_cubit.dart';

class CartHeaderProductsNumber extends StatelessWidget {
  const CartHeaderProductsNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xffEBF9F1)),
      width: double.infinity,
      height: 40,
      child: Center(
        child: Text(
          'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
          style: TextStyles.font13MainLightGreenSemiBold,
        ),
      ),
    );
  }
}
