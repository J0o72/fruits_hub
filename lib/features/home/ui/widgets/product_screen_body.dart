import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';

class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomAppBar(
            titleText: 'المنتجات',
            hasLeadingIcon: false,
            hasTrillingIcon: true,
          ),
        ],
      ),
    );
  }
}
