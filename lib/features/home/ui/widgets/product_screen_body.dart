import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/home/ui/widgets/products_result_and_filtering_bar.dart';
import 'package:fruit_hub/features/home/ui/widgets/search_text_field.dart';

class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomAppBar(
            titleText: 'المنتجات',
            hasLeadingIcon: false,
            hasTrillingIcon: true,
          ),
          verticalSpace(16),
          SearchTextField(),
          verticalSpace(16),
          ProductsResultAndFilteringBar(),
        ],
      ),
    );
  }
}
