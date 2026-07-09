import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset('assets/images/profile_image.png'),
      ),
      title: Text('صباح الخير !..', style: TextStyles.font16lightGrayRegular),
      subtitle: Text('أحمد مصطفي', style: TextStyles.font16LightBlackBold),
      trailing: CircleAvatar(
        backgroundColor: AppColors.mainLightestGreen,
        child: SvgPicture.asset('assets/SVGs/notification_icon.svg'),
      ),
    );
  }
}
