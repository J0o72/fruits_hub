import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/skeletonizer_fruit_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerProductsGridView extends StatelessWidget {
  const SkeletonizerProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
      child: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 160 / 214,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return SkeletonizerFruitItem();
        },
      ),
    );
  }
}
