import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/show_error_dialog.dart';
import 'package:fruit_hub/features/auth/logic/login/login_cubit.dart';
import 'package:fruit_hub/features/auth/logic/login/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccess || current is LoginFailure,
      listener: (context, state) {
        if (state is LoginSuccess) {
          log('Login Success');
        } else if (state is LoginFailure) {
          showErrorDialog(context, state);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
