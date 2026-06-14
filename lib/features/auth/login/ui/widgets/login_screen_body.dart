import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/auth/login/ui/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/login/ui/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/login/ui/widgets/social_media_login_widget.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
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

            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.forgetPasswordScreen);
              },
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.font13MainLightGreenSemiBold,
                  ),
                ],
              ),
            ),
            verticalSpace(32),

            AppTextButton(onPressed: () {}, text: 'تسجيل دخول'),
            verticalSpace(32),

            DontHaveAccountWidget(),

            verticalSpace(32),

            OrDivider(),
            verticalSpace(32),

            SocialMediaLoginWidget(
              titleText: 'تسجيل بواسطة جوجل',
              leadingIcon: AppImages.googleIconLogin,
            ),

            verticalSpace(18),

            SocialMediaLoginWidget(
              titleText: 'تسجيل بواسطة أبل',
              leadingIcon: AppImages.appleIconLogin,
            ),

            verticalSpace(18),

            SocialMediaLoginWidget(
              titleText: 'تسجيل بواسطة فيسبوك',
              leadingIcon: AppImages.facebookIconLogin,
            ),

            verticalSpace(18),
          ],
        ),
      ),
    );
  }
}
