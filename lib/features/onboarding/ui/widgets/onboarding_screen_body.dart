import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboarding/ui/widgets/page_view_item.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageView(children: [PageViewItem()]),
      ],
    );
  }
}
