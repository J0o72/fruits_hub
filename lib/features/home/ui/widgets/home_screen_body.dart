import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/cubits/product/product_cubit.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/features/home/ui/widgets/best_seller_and_more_row.dart';
import 'package:fruit_hub/features/home/ui/widgets/home_app_bar.dart';
import 'package:fruit_hub/features/home/ui/widgets/home_banner_list_view.dart';
import 'package:fruit_hub/features/home/ui/widgets/products_gird_view_bloc_builder.dart';
import 'package:fruit_hub/features/home/ui/widgets/search_text_field.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeAppBar(),
                verticalSpace(16),
                SearchTextField(),
                verticalSpace(12),
                HomeBannerListView(),
                verticalSpace(12),
                BestSellerAndMoreRow(),
                verticalSpace(12),
              ],
            ),
          ),

          ProductsGridViewBlocBuilder(),
          SliverToBoxAdapter(child: verticalSpace(16)),
        ],
      ),
    );
  }
}
