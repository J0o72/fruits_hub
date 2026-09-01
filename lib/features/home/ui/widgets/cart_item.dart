import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/home/logic/cart/cart_cubit.dart';
import 'package:fruit_hub/features/home/logic/cart_item/cart_item_cubit.dart';
import 'package:fruit_hub/features/home/logic/cart_item/cart_item_state.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_item_buttons_and_total_price.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  height: 115,
                  width: 115,
                  child: CachedNetworkImage(
                    imageUrl: cartItemEntity.productEntity.imageUrl ?? '',
                    errorWidget: (context, url, error) =>
                        Center(child: Icon(Icons.error)),
                    placeholder: (context, url) => Container(
                      color: Colors.transparent,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),

                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartItemEntity.productEntity.name,
                            style: TextStyles.font13LightBlackBold,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<CartCubit>().deleteCartItem(
                                cartItemEntity,
                              );
                            },
                            child: SvgPicture.asset('assets/SVGs/trash.svg'),
                          ),
                        ],
                      ),

                      Text(
                        '${cartItemEntity.calculateTotalWeight()} كم',
                        style: TextStyles.font13SecondaryLightYelloSemiBold,
                      ),

                      CartItemButtonsAndTotalPrice(
                        cartItemEntity: cartItemEntity,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
