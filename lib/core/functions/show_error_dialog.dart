import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/auth/logic/register/register_state.dart';

Future<dynamic> showErrorDialog(BuildContext context, RegisterFailure state) {
  return showDialog(
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
            child: Text('Got it', style: TextStyles.font19LightBlackBold),
          ),
        ),
      ],
    ),
  );
}
