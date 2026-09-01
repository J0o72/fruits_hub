import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/home/logic/cart/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(super.initialState);

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProduct(ProductEntity product) {
    bool isProductExist = cartEntity.isProductExist(product);
    var cartItem = cartEntity.getCartItem(product);

    if (isProductExist) {
      cartItem.increaseQuantity();
    } else {
      cartEntity.addCartItem(cartItem);
    }
  }
}
