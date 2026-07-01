import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/auth/ui/register/widgets/custom_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            isTermsAccepted = value;
            setState(() {});
          },
        ),
        horizontalSpace(12),
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.font13lightGraySemiBold,
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا ',
                  style: TextStyles.font13MainLightGreenSemiBold,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
