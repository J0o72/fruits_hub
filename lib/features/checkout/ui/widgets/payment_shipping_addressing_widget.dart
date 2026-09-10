import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/ui/widgets/payment_section_item.dart';

class PaymentShippingAddressingWidget extends StatelessWidget {
  const PaymentShippingAddressingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentSectionItem(
      title: 'عنوان التوصيل :',
      child: Row(
        children: [
          SvgPicture.asset('assets/SVGs/location.svg'),
          horizontalSpace(8),
          Text(
            "${context.read<OrderEntity>().shippingAddressEntity}",
            style: TextStyles.font16lightGrayRegular,
          ),
          Spacer(),
          Row(
            children: [
              SvgPicture.asset('assets/SVGs/edit.svg'),
              horizontalSpace(4),
              Text('تعديل', style: TextStyles.font13LightGrayRegular),
            ],
          ),
        ],
      ),
    );
  }
}
