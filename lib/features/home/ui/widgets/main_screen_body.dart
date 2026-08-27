import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/ui/cart_screen.dart';
import 'package:fruit_hub/features/home/ui/product_screen.dart';
import 'package:fruit_hub/features/home/ui/widgets/home_screen.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: [HomeScreen(), ProductScreen(), CartScreen()],
    );
  }
}
