import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboarding/ui/widgets/onboarding_page_view_widget.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [OnBoardingPageViewWidget()])),
    );
  }
}
