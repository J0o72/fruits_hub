import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/auth/login/ui/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/login/ui/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/login/ui/widgets/social_media_login_widget.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

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
            AppTextFormField(
              hintText: 'البريد الإلكتروني',
              validator: (value) {},
            ),

            verticalSpace(16),
            AppTextFormField(
              hintText: 'كلمة المرور',
              validator: (value) {},
              isObscureText: true,
              suffixIcon: Icon(
                Icons.visibility_rounded,
                color: AppColors.lightGray,
              ),
            ),
            verticalSpace(16),

            Row(
              mainAxisAlignment: .end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.font13MainLightGreenSemiBold,
                ),
              ],
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(75),
            border: Border.all(width: 2, color: Color(0xffF1F1F5)),
            // color: Colors.amberAccent,
          ),
          child: IconButton(
            iconSize: 20,
            padding: EdgeInsets.all(0),
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        horizontalSpace(MediaQuery.of(context).size.width * 0.25),
        Text('تسجيل دخول', style: TextStyles.font19LightBlackBold),
      ],
    );
  }
}
