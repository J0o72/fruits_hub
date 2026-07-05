import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/logic/login/login_cubit.dart';
import 'package:fruit_hub/features/auth/ui/widgets/email_and_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: EmailAndPassword(
        isRegister: false,
        emailController: context.read<LoginCubit>().emailController,
        passwordController: context.read<LoginCubit>().passwordController,
      ),
    );
  }
}
