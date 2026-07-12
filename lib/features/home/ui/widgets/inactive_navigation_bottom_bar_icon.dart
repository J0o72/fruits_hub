import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/features/home/domain/entities/navigation_bottom_bar_entity.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, this.navigationBottomBarEntity});

  final NavigationBottomBarEntity? navigationBottomBarEntity;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('');
  }
}
