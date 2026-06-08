import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/features/onboarding/ui/widgets/onboarding_page_view_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OnBoardingPageViewWidget(),

            DotsIndicator(
              dotsCount: 2,
              decorator: DotsDecorator(activeColor: AppColors.mainGreen),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: AppTextButton(onPressed: () {}, text: 'ابدأ الان'),
            ),

            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
