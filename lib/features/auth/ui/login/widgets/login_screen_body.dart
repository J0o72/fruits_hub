import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/auth/logic/login/login_cubit.dart';
import 'package:fruit_hub/features/auth/ui/login/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/ui/login/widgets/login_form.dart';
import 'package:fruit_hub/features/auth/ui/login/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/ui/login/widgets/social_media_login_widget.dart';
import 'package:fruit_hub/features/auth/ui/widgets/auth_text_button.dart';

import '../../../../../core/helpers/app_images.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(16),
            LoginForm(),
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

            AuthTextButton(
              onPressed: () {
                if (context
                        .read<LoginCubit>()
                        .formKey
                        .currentState
                        ?.validate() ??
                    false) {
                  context.read<LoginCubit>().formKey.currentState?.save;
                  log('Login Done');
                }
              },
              widget: Text('تسجيل دخول', style: TextStyles.font16WhiteBold),
            ),
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
