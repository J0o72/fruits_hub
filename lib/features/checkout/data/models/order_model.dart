import 'package:fruit_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruit_hub/features/checkout/data/models/shipping_addressing_model.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressingModel shippingAddressingModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  // final String orderId;

  OrderModel({
    required this.totalPrice,
    required this.uID,
    required this.shippingAddressingModel,
    required this.orderProducts,
    required this.paymentMethod,
  });
}
