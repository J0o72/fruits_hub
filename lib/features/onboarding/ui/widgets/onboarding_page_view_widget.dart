import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/app_images.dart';
import 'package:fruit_hub/features/onboarding/ui/widgets/page_view_item.dart';
import 'package:fruit_hub/features/onboarding/ui/widgets/title_page_view_widget.dart';

class OnBoardingPageViewWidget extends StatelessWidget {
  const OnBoardingPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        children: [
          PageViewItem(
            backgroundImage: AppImages.onBoardingBackgroundImagePageView1,
            image: AppImages.onBoardingImagePageView1,
            title: TitlePageViewWidget(
              isExistEnglishText: true,
              arabicText: 'مرحبًا بك في ',
            ),
            subTitle:
                "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          ),

          PageViewItem(
            backgroundImage: AppImages.onBoardingBackgroundImagePageView2,
            image: AppImages.onBoardingImagePageView2,
            title: TitlePageViewWidget(
              isExistEnglishText: false,
              arabicText: 'ابحث وتسوق',
            ),
            subTitle:
                "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          ),
        ],
      ),
    );
  }
}
