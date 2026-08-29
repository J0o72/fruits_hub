import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: const CartScreenBody());
  }
}
