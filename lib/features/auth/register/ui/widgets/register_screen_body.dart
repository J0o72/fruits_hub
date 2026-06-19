import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/auth/register/ui/widgets/already_have_account.dart';
import 'package:fruit_hub/features/auth/register/ui/widgets/register_form.dart';
import 'package:fruit_hub/features/auth/register/ui/widgets/terms_and_conditions_widget.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            RegisterForm(formKey: formKey),

            verticalSpace(16),

            TermsAndConditionsWidget(),

            verticalSpace(32),

            AppTextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  log('Validation is okay');
                }
              },
              text: 'تسجيل دخول',
            ),
            verticalSpace(32),

            AlreadyHaveAccount(),

            verticalSpace(32),
          ],
        ),
      ),
    );
  }
}
