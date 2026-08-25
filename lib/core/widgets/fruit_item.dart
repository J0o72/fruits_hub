import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightestGray,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl ?? '',
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                  placeholder: (context, url) => Container(
                    color: Colors.transparent,
                    width: 100,
                    height: 100,
                  ),
                  fit: BoxFit.cover,
                ),
              ),

              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    product.name,
                    textAlign: TextAlign.right,
                    style: TextStyles.font13LightBlackSemiBold,
                  ),
                ),
                subtitle: Text.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${product.price}جنية / ',
                        style: TextStyles.font13SecondaryYelloBold,
                      ),

                      TextSpan(
                        text: 'الكيلو',
                        style: TextStyles.font13SecondaryLightYelloSemiBold,
                      ),
                    ],
                  ),
                ),

                trailing: const CircleAvatar(
                  backgroundColor: AppColors.mainGreen,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),

          Positioned(
            top: 5,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/SVGs/favorite_icon.svg',
                width: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
