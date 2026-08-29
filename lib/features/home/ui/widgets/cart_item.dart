import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/home/ui/widgets/cart_item_buttons_and_total_price.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(
              height: 115,
              child: CachedNetworkImage(
                imageUrl:
                    'https://sujifresh.com/cdn/shop/products/Watermelon_323fe32d-2bb3-4f99-97be-4e8889f7724e_1024x1024.jpg?v=1535370600',
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
                      Text('بطيخ', style: TextStyles.font13LightBlackBold),
                      SvgPicture.asset('assets/SVGs/trash.svg'),
                    ],
                  ),

                  Text(
                    '3 كم',
                    style: TextStyles.font13SecondaryLightYelloSemiBold,
                  ),

                  CartItemButtonsAndTotalPrice(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
