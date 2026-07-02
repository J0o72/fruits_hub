import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/auth/logic/register/register_cubit.dart';
import 'package:fruit_hub/features/auth/logic/register/register_state.dart';
import 'package:fruit_hub/features/auth/ui/register/widgets/already_have_account.dart';
import 'package:fruit_hub/features/auth/ui/register/widgets/register_bloc_listener.dart';
import 'package:fruit_hub/features/auth/ui/register/widgets/register_form.dart';
import 'package:fruit_hub/features/auth/ui/register/widgets/terms_and_conditions_widget.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            RegisterForm(),

            verticalSpace(16),

            TermsAndConditionsWidget(),

            verticalSpace(32),

            AppTextButton(
              onPressed: () {
                validateThenDoRegister(context);
              },
              widget: context.watch<RegisterCubit>().state is RegisterLoading
                  ? const AuthButtonLoadingState()
                  : Text('تسجيل حساب', style: TextStyles.font16WhiteBold),
            ),
            verticalSpace(32),

            AlreadyHaveAccount(),

            verticalSpace(32),

            RegisterBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState?.validate() ??
        false) {
      context.read<RegisterCubit>().formKey.currentState?.save;

      log(
        'name: ${context.read<RegisterCubit>().nameController.text}, email: ${context.read<RegisterCubit>().emailController.text}, password: ${context.read<RegisterCubit>().passwordController.text}',
      );

      context.read<RegisterCubit>().createAccountUsingEmailAndPassword(
        email: context.read<RegisterCubit>().emailController.text,
        password: context.read<RegisterCubit>().passwordController.text,
        name: context.read<RegisterCubit>().nameController.text,
      );
    }
  }
}
