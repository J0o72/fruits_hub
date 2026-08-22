import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/shared_pref_keys.dart';
import 'package:fruit_hub/core/helpers/shared_pref_singleton.dart';
import 'package:fruit_hub/core/routing/app_router.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class FruitsHubApp extends StatelessWidget {
  const FruitsHubApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Fruits Hub App',
        theme: ThemeData(
          fontFamily: 'Cairo',
          primaryColor: AppColors.mainGreen,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute:
            SharedPrefSingleton.getBool(SharedPrefKeys.isOnBoardingSeen)!
            ? FirebaseAuthService().isLoggedIn()
                  ? Routes.mainScreen
                  : Routes.loginScreen
            : Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
