import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'تمتلك حساب بالفعل؟ ',
              style: TextStyles.font16lightGraySemiBold,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () => context.pop(),
              text: 'تسجيل دخول',
              style: TextStyles.font16MainGreenSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
