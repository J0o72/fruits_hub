import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/product/product_cubit.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/home/ui/widgets/products_gird_view_bloc_builder.dart';
import 'package:fruit_hub/features/home/ui/widgets/products_result_and_filtering_bar.dart';
import 'package:fruit_hub/features/home/ui/widgets/search_text_field.dart';

class ProductScreenBody extends StatefulWidget {
  const ProductScreenBody({super.key});

  @override
  State<ProductScreenBody> createState() => _ProductScreenBodyState();
}

class _ProductScreenBodyState extends State<ProductScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
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
                verticalSpace(16),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
