import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/logic/cart/cart_state.dart';

class CartItemCubit extends Cubit<CartState> {
  CartItemCubit() : super(CartInitial());
}
