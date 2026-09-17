import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/show_custom_snack_bar.dart';
import 'package:fruit_hub/features/checkout/logic/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/checkout/logic/add_order_cubit/add_order_state.dart';

class AddOrderBlocBuilder extends StatelessWidget {
  const AddOrderBlocBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, AddOrderState>(
      builder: (context, state) {
        return child;
      },
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          showCustomSnackBar(context, 'تمت العملية بنجاح');
        }

        if (state is AddOrderFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
    );
  }
}
