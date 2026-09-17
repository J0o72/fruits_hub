import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_hub/core/functions/show_custom_snack_bar.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/services/paypal_payment_keys.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/ui/widgets/auth_button_loading_state.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit_hub/features/checkout/logic/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/checkout/logic/add_order_cubit/add_order_state.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_screen_button.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/checkout_steps_page_view.dart';
import 'package:fruit_hub/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key, required this.cartEntity});

  final CartEntity cartEntity;

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  late PageController pageController;
  int currPageIndex = 0;

  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currPageIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    valueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomAppBar(
            titleText: getCheckoutAppBarText(currPageIndex),
            hasLeadingIcon: true,
          ),
          verticalSpace(16),
          CheckoutSteps(
            currPageIndex: currPageIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: _formKey,
              valueListenable: valueNotifier,
            ),
          ),

          CheckoutScreenButton(
            child: context.watch<OrderCubit>().state is AddOrderLoading
                ? const AuthButtonLoadingState()
                : Text(
                    getCheckoutButtonText(currPageIndex),
                    style: TextStyles.font16WhiteBold,
                  ),
            onPressed: () {
              if (currPageIndex == 0) {
                checkAndNavigateToShippingAddressingPageView(context);
              } else if (currPageIndex == 1) {
                validateShippingAddressingThenMoveToNextPageView();
              } else {
                paymentProcess(context);
              }
            },
          ),
          verticalSpace(50),
        ],
      ),
    );
  }

  void paymentProcess(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: PaypalPaymentKeys.clientId,
          secretKey: PaypalPaymentKeys.secretKey,
          transactions: [paypalPaymentEntity.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            context.read<OrderCubit>().addOrder(orderEntity: orderEntity);
          },
          onError: (error) {
            Navigator.pop(context);
            log(error.toString());
            showCustomSnackBar(context, 'حدث خطأ في عملية الدفع');
          },
          onCancel: () {
            showCustomSnackBar(context, 'تم الغاء عملية الدفع');
          },
        ),
      ),
    );
  }

  void validateShippingAddressingThenMoveToNextPageView() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void checkAndNavigateToShippingAddressingPageView(BuildContext context) {
    if (context.read<OrderEntity>().paymentMethod != null) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      showCustomSnackBar(context, 'يرجي تحديد طريقة الدفع');
    }
  }
}

String getCheckoutButtonText(int currentPage) {
  switch (currentPage) {
    case 0:
      return 'التالي';
    case 1:
      return 'التالي';
    case 2:
      return 'الدفع عبر PayPal';

    default:
      return 'التالي';
  }
}

String getCheckoutAppBarText(int currentPage) {
  switch (currentPage) {
    case 0:
      return 'الشحن';
    case 1:
      return 'العنوان';
    case 2:
      return 'الدفع';

    default:
      return '';
  }
}
