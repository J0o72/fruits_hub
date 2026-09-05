import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_screen_body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: CheckoutScreenBody()));
  }
}
