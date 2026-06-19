import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/app_regex.dart';
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
  final formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();

    passwordController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              verticalSpace(16),
              AppTextFormField(
                controller: nameController,
                hintText: 'الاسم كامل',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ادخال الاسم في هذا الحقل';
                  }
                },
              ),
              verticalSpace(16),
              AppTextFormField(
                controller: emailController,
                hintText: 'البريد الإلكتروني',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ادخال بريدك الالكتروني';
                  } else if (!AppRegex.isEmailValid(value)) {
                    return 'البريد الالكتروني غير صحيح';
                  }
                },
              ),

              verticalSpace(16),
              AppTextFormField(
                controller: passwordController,
                hintText: 'كلمة المرور',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ادخال كلمة المرور في هذا الحقل';
                  } else if (!AppRegex.hasLowerCase(value)) {
                    return 'لا يحتوي علي حرف صغير';
                  } else if (!AppRegex.hasUpperCase(value)) {
                    return 'لا يحتوي علي حرف كبير';
                  } else if (!AppRegex.hasNumber(value)) {
                    return 'لا يحتوي علي رقم';
                  } else if (!AppRegex.hasSpecialCharacter(value)) {
                    return 'لا يحتوي علي رمز خاص';
                  } else if (!AppRegex.hasMinLength(value)) {
                    return 'كلمة المرور اقل من 8 أحرف';
                  }
                },
                isObscureText: isObscureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: isObscureText
                      ? Icon(
                          Icons.visibility_rounded,
                          color: AppColors.lightGray,
                        )
                      : Icon(
                          Icons.visibility_off_rounded,
                          color: AppColors.lightGray,
                        ),
                ),
              ),
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
      ),
    );
  }
}
