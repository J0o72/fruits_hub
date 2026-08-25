import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/ui/widgets/custom_navigation_bottom_bar.dart';
import 'package:fruit_hub/features/home/ui/widgets/main_screen_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBottomBar(
        onItemTapped: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(child: MainScreenBody(currentViewIndex: currentIndex)),
    );
  }
}
