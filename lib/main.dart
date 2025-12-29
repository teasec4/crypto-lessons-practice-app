import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/routing/app_router.dart';
import 'package:crypto_trading_lessons/core/constants/app_themes.dart';
import 'package:crypto_trading_lessons/core/constants/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
