import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/app_regex.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({
    super.key,
    required this.passwordController,
    required this.emailController,
  });

  final TextEditingController passwordController;
  final TextEditingController emailController;

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  @override
  void dispose() {
    super.dispose();
    widget.passwordController.dispose();
    widget.emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: widget.emailController,
          hintText: 'البريد الإلكتروني',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يجب ادخال بريدك الالكتروني في هذا الحقل';
            } else if (!AppRegex.isEmailValid(value)) {
              return 'البريد الالكتروني غير صحيح';
            }
          },
        ),

        verticalSpace(16),
        AppTextFormField(
          controller: widget.passwordController,
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
                ? Icon(Icons.visibility_rounded, color: AppColors.lightGray)
                : Icon(
                    Icons.visibility_off_rounded,
                    color: AppColors.lightGray,
                  ),
          ),
        ),
      ],
    );
  }
}
