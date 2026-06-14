import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/auth/register/ui/widgets/already_have_account.dart';
import 'package:fruit_hub/features/auth/register/ui/widgets/terms_and_conditions_widget.dart';

import '../../../../../core/widgets/app_text_form_field.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<RegisterScreenBody> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(16),
            AppTextFormField(hintText: 'الاسم كامل', validator: (value) {}),
            verticalSpace(16),
            AppTextFormField(
              hintText: 'البريد الإلكتروني',
              validator: (value) {},
            ),

            verticalSpace(16),
            AppTextFormField(
              hintText: 'كلمة المرور',
              validator: (value) {},
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: isObscureText
                    ? Icon(Icons.visibility_rounded, color: AppColors.lightGray)
                    : Icon(
                        Icons.visibility_off_rounded,
                        color: AppColors.lightGray,
                      ),
              ),
            ),
            verticalSpace(16),

            TermsAndConditionsWidget(),

            verticalSpace(32),

            AppTextButton(onPressed: () {}, text: 'تسجيل دخول'),
            verticalSpace(32),

            AlreadyHaveAccount(),

            verticalSpace(32),
          ],
        ),
      ),
    );
  }
}
