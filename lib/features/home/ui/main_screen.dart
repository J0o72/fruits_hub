import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/show_custom_snack_bar.dart';
import 'package:fruit_hub/features/home/logic/cart/cart_cubit.dart';
import 'package:fruit_hub/features/home/logic/cart/cart_state.dart';
import 'package:fruit_hub/features/home/ui/widgets/custom_navigation_bottom_bar.dart';
import 'package:fruit_hub/features/home/ui/widgets/main_screen_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomNavigationBottomBar(
          onItemTapped: (index) {
            currentIndex = index;
            setState(() {});
          },
        ),
        body: SafeArea(
          child: BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartItemAdded) {
                showCustomSnackBar(context, 'تمت العملية بنجاح');
              }
              if (state is CartItemRemoved) {
                showCustomSnackBar(context, 'تم حذف العنصر بنجاح');
              }
            },
            child: MainScreenBody(currentViewIndex: currentIndex),
          ),
        ),
      ),
    );
  }
}
