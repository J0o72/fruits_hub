import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/logic/cart_item/cart_item_cubit.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => CartItemCubit(),
        child: const CartScreenBody(),
      ),
    );
  }
}
