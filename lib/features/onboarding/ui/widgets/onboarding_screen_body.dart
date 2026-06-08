import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/features/onboarding/ui/widgets/onboarding_page_view_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
