import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class AddressingSection extends StatelessWidget {
  const AddressingSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          autovalidateMode: value,
          key: formKey,
          child: Column(
            children: [
              verticalSpace(24),
              AppTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.name = val!;
                },
                hintText: 'الاسم كامل',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ادخال الاسم في هذا الحقل';
                  }
                },
              ),
              verticalSpace(8),
              AppTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.email =
                      val!;
                },
                hintText: 'البريد الإلكتروني',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ادخال الاسم في هذا الحقل';
                  }
                },
              ),
              verticalSpace(8),

              AppTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.phone =
                      val!;
                },
                hintText: 'رقم الهاتف',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ادخال الاسم في هذا الحقل';
                  }
                },
              ),
              verticalSpace(8),

              AppTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.address =
                      val!;
                },
                hintText: 'العنوان',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ادخال الاسم في هذا الحقل';
                  }
                },
              ),
              verticalSpace(8),

              AppTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.city = val!;
                },
                hintText: 'المدينه',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ادخال الاسم في هذا الحقل';
                  }
                },
              ),
              verticalSpace(8),

              AppTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.floor =
                      val!;
                },
                hintText: 'رقم الطابق , رقم الشقه ..',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ادخال الاسم في هذا الحقل';
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
