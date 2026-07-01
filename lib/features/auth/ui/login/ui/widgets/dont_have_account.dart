import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

import '../../../../../../core/routing/routes.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'لا تمتلك حساب؟ ',
              style: TextStyles.font16lightGraySemiBold,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.pushNamed(Routes.registerScreen),
              text: 'قم بإنشاء حساب',
              style: TextStyles.font16MainGreenSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
