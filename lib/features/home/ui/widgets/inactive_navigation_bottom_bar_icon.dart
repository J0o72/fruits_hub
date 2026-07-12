import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.imageIcon});

  final String imageIcon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(imageIcon);
  }
}
