import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/app_images.dart';
import 'package:fruit_hub/features/onboarding/ui/widgets/page_view_item.dart';
import 'package:fruit_hub/features/onboarding/ui/widgets/title_page_view_widget.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                children: [
                  PageViewItem(
                    backgroundImage:
                        AppImages.onBoardingBackgroundImagePageView1,
                    image: AppImages.onBoardingImagePageView1,
                    title: TitlePageViewWidget(),
                    subTitle:
                        "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
