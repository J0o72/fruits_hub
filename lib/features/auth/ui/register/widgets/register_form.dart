import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/core/widgets/email_and_password.dart';
import 'package:fruit_hub/features/auth/logic/register/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = context.read<RegisterCubit>().nameController;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
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
          EmailAndPassword(
            emailController: context.read<RegisterCubit>().emailController,
            passwordController: context
                .read<RegisterCubit>()
                .passwordController,
          ),
        ],
      ),
    );
  }
}
