import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/ui/widgets/custom_navigation_bottom_bar.dart';
import 'package:fruit_hub/features/home/ui/widgets/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBottomBar(),
      body: SafeArea(child: HomeScreen()),
    );
  }
}
