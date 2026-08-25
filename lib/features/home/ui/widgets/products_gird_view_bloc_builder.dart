import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/product/product_cubit.dart';
import 'package:fruit_hub/core/cubits/product/product_state.dart';
import 'package:fruit_hub/features/home/ui/widgets/products_grid_view.dart';
import 'package:fruit_hub/features/home/ui/widgets/skeletonizer_products_grid_view.dart';

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
          return SkeletonizerProductsGridView();
        }
      },
    );
  }
}
