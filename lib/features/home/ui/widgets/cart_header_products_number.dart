import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

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
          'لديك 3 منتجات في سله التسوق',
          style: TextStyles.font13MainLightGreenSemiBold,
        ),
      ),
    );
  }
}
