import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class TitlePageViewWidget extends StatelessWidget {
  const TitlePageViewWidget({
    super.key,
    required this.isExistEnglishText,
    required this.arabicText,
  });
  final bool isExistEnglishText;
  final String arabicText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(text: arabicText, style: TextStyles.font23LightBlackBold),
            isExistEnglishText
                ? TextSpan(text: 'Fruit', style: TextStyles.font23MainGreenBold)
                : TextSpan(text: ''),
            isExistEnglishText
                ? TextSpan(
                    text: 'HUB',
                    style: TextStyles.font23SecondaryYelloBold,
                  )
                : TextSpan(text: ''),
          ],
        ),
      ),
    );
  }
}
