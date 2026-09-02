import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/home/logic/cart/cart_cubit.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_custom_button.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_header_products_number.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_items_list.dart';
import 'package:fruit_hub/features/home/ui/widgets/custom_divider.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                    child: CustomAppBar(
                      titleText: 'السلة',
                      hasLeadingIcon: true,
                      hasTrillingIcon: false,
                    ),
                  ),
                  verticalSpace(16),
                  CartHeaderProductsNumber(),
                  verticalSpace(24),
                ],
              ),
            ),
            SliverToBoxAdapter(child: CustomDivider()),
            CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(child: CustomDivider()),
          ],
        ),

        Positioned(right: 10, left: 10, bottom: 50, child: CustomCartButton()),
      ],
    );
  }
}
