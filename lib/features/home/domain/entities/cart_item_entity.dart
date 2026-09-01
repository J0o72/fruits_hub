import 'package:fruit_hub/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({this.quantity = 0, required this.productEntity});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  int calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  int increaseQuantity() {
    return quantity + 1;
  }

  int decreaseQuantity() {
    return quantity - 1;
  }
}
