import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class TitlePageViewWidget extends StatelessWidget {
  const TitlePageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'مرحبًا بك في',
            style: TextStyles.font23LightBlackBold,
          ),
          TextSpan(text: 'Fruit', style: TextStyles.font23MainGreenBold),
          TextSpan(text: 'HUB', style: TextStyles.font23SecondaryYelloBold),
        ],
      ),
    );
  }
}
