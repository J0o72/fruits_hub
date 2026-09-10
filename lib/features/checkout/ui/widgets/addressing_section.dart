import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';

class AddressingSection extends StatelessWidget {
  const AddressingSection({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            verticalSpace(24),
            AppTextFormField(hintText: 'الاسم كامل', validator: (a) {}),
            verticalSpace(8),
            AppTextFormField(hintText: 'البريد الإلكتروني', validator: (a) {}),
            verticalSpace(8),

            AppTextFormField(hintText: 'رقم الهاتف', validator: (a) {}),
            verticalSpace(8),

            AppTextFormField(hintText: 'العنوان', validator: (a) {}),
            verticalSpace(8),

            AppTextFormField(hintText: 'المدينه', validator: (a) {}),
            verticalSpace(8),

            AppTextFormField(
              hintText: 'رقم الطابق , رقم الشقه ..',
              validator: (a) {},
            ),
          ],
        ),
      ),
    );
  }
}
