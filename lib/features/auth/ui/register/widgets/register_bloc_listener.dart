import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/auth/logic/register/register_cubit.dart';
import 'package:fruit_hub/features/auth/logic/register/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      child: const SizedBox.shrink(),
      listenWhen: (previous, current) =>
          current is RegisterSuccess ||
          current is RegisterFailure ||
          current is RegisterLoading,
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
            },
          );

          context.pop();
        } else if (state is RegisterSuccess) {
          context.pop();
          context.pushNamed(Routes.loginScreen);
        } else if (state is RegisterFailure) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: Icon(Icons.error, color: Colors.red),
              content: Text(
                state.message.toString(),
                style: TextStyles.font19LightBlackBold,
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Center(
                    child: Text(
                      'Got it',
                      style: TextStyles.font19LightBlackBold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
