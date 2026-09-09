import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uID;
  final CartEntity cartItems;
  String? paymentMethod;
  ShippingAddressEntity shippingAddressEntity;

  OrderEntity({
    required this.cartItems,
    this.paymentMethod,
    required this.shippingAddressEntity,
    required this.uID,
  });
}
