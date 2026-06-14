import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
    required this.titleText,
    required this.hasLeadingIcon,
  });
  final String titleText;
  final bool hasLeadingIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text(titleText, style: TextStyles.font19LightBlackBold),
      leading: hasLeadingIcon
          ? Center(
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.lighterGray),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded, size: 20),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
