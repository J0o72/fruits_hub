import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/product/product_cubit.dart';
import 'package:fruit_hub/core/cubits/product/product_state.dart';
import 'package:fruit_hub/core/functions/get_dummy_product.dart';
import 'package:fruit_hub/features/home/ui/widgets/prodducts_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text('حدث خطأ ما ، حاول مرة اخري')),
          );
        } else if (state is ProductsSuccess) {
          return ProductsGridView(products: state.products);
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
