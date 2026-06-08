import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routing/routes.dart';

import '../../features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      default:
        return null;
    }
  }
}
