import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/get_user_data.dart';
import 'package:fruit_hub/core/helpers/payment_method_constants.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_screen_body.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cartEntity});

  final CartEntity cartEntity;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late OrderEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
      uID: getUserData().userId,
      shippingAddressEntity: ShippingAddressEntity(),
      cartItems: widget.cartEntity,
      paymentMethod: PaymentMethodConstants.cash,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Provider<OrderEntity>.value(
          value: orderEntity,
          child: CheckoutScreenBody(cartEntity: widget.cartEntity),
        ),
      ),
    );
  }
}
