import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/shared_pref_singleton.dart';
import 'package:fruit_hub/core/routing/app_router.dart';
import 'package:fruit_hub/fruits_hub_app.dart';

// fake push
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefSingleton.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      startLocale: Locale('ar'),
      child: FruitsHubApp(appRouter: AppRouter()),
    ),
  );
}
