import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_header_products_number.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(
                titleText: 'السلة',
                hasLeadingIcon: true,
                hasTrillingIcon: false,
              ),
              verticalSpace(16),
              CartHeaderProductsNumber(),
              verticalSpace(16),
            ],
          ),
        ),
        // ProductsGridViewBlocBuilder(),
      ],
    );
  }
}
