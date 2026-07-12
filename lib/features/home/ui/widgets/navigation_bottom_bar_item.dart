import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entities/navigation_bottom_bar_entity.dart';
import 'package:fruit_hub/features/home/ui/widgets/active_navigation_bottom_bar_icon.dart';
import 'package:fruit_hub/features/home/ui/widgets/inactive_navigation_bottom_bar_icon.dart';

class NavigationBottomBarItem extends StatelessWidget {
  const NavigationBottomBarItem({
    super.key,
    required this.isSelected,
    required this.navigationBottomBarEntity,
  });

  final bool isSelected;
  final NavigationBottomBarEntity navigationBottomBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: navigationBottomBarEntity.activeImage,
            text: navigationBottomBarEntity.name,
          )
        : InActiveItem(image: navigationBottomBarEntity.inActiveImage);
  }
}
