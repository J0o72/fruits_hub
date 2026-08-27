import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/DI/dependancy_injection.dart';
import 'package:fruit_hub/core/cubits/product/product_cubit.dart';
import 'package:fruit_hub/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub/features/home/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(productRepo: getIt<ProductRepo>()),
      child: HomeScreenBody(),
    );
  }
}
