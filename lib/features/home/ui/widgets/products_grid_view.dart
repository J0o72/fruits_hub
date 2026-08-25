import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 160 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return FruitItem(product: products[index]);
      },
    );
  }
}
