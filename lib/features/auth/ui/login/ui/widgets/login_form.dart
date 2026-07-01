import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/email_and_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, this.formKey});
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(key: formKey, child: EmailAndPassword());
  }
}
