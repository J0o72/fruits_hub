import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/auth/logic/register/register_cubit.dart';
import 'package:fruit_hub/features/auth/logic/register/register_state.dart';
import 'package:fruit_hub/features/auth/ui/register/widgets/already_have_account.dart';
import 'package:fruit_hub/features/auth/ui/register/widgets/register_bloc_listener.dart';
import 'package:fruit_hub/features/auth/ui/register/widgets/register_form.dart';
import 'package:fruit_hub/features/auth/ui/register/widgets/terms_and_conditions_widget.dart';
import 'package:fruit_hub/features/auth/ui/widgets/auth_button_loading_state.dart';
import 'package:fruit_hub/features/auth/ui/widgets/auth_text_button.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  bool isAcceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            RegisterForm(),

            verticalSpace(16),

            TermsAndConditionsWidget(
              onChanged: (value) {
                isAcceptedTerms = value;
              },
            ),

            verticalSpace(32),

            AuthTextButton(
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
      if (isAcceptedTerms) {
        context.read<RegisterCubit>().createAccountUsingEmailAndPassword(
          email: context.read<RegisterCubit>().emailController.text,
          password: context.read<RegisterCubit>().passwordController.text,
          name: context.read<RegisterCubit>().nameController.text,
        );
      } else {
        showDialogForTermsAndConditions(context);
      }
    } else {}
  }

  Future<dynamic> showDialogForTermsAndConditions(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('! تنبيه'),
        content: const Text('يجب الموافقة على الشروط والأحكام'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }
}
