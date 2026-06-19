import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/core/widgets/email_and_password.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, this.formKey});
  final GlobalKey<FormState>? formKey;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          verticalSpace(16),
          AppTextFormField(
            controller: nameController,
            hintText: 'الاسم كامل',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يجب ادخال الاسم في هذا الحقل';
              }
            },
          ),
          verticalSpace(16),
          EmailAndPassword(),
        ],
      ),
    );
  }
}
