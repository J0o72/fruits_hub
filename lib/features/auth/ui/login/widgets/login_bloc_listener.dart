import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/show_error_dialog.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/features/auth/logic/login/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listenWhen: (previous, current) =>
          current is LoginSuccess ||
          current is LoginFailure ||
          current is LoginLoading,
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pop();
          context.pushNamed(Routes.homeScreen);
        } else if (state is LoginFailure) {
          showErrorDialog(context, state);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
