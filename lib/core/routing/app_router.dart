import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/features/auth/register/ui/register_screen.dart';

import '../../features/auth/login/ui/login_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      default:
        return null;
    }
  }
}
