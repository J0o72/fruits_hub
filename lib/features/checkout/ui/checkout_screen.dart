import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_screen_body.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.cartEntity});

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CheckoutScreenBody(cartEntity: cartEntity)),
    );
  }
}
