import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entities/navigation_bottom_bar_entity.dart';
import 'package:fruit_hub/features/home/ui/widgets/home_screen_body.dart';
import 'package:fruit_hub/features/home/ui/widgets/navigation_bottom_bar_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBottomBar(),
      body: SafeArea(child: HomeScreenBody()),
    );
  }
}

class CustomNavigationBottomBar extends StatefulWidget {
  const CustomNavigationBottomBar({super.key});

  @override
  State<CustomNavigationBottomBar> createState() =>
      _CustomNavigationBottomBarState();
}

class _CustomNavigationBottomBarState extends State<CustomNavigationBottomBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),

      child: Row(
        children: navigationBottomBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return NavigationBottomBarItem(
            isSelected: selectedIndex == index,
            navigationBottomBarEntity: entity,
          );
        }).toList(),
      ),
    );
  }
}
