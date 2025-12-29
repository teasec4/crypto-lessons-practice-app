import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto_trading_lessons/core/routing/app_router.dart';
import 'package:crypto_trading_lessons/core/constants/app_themes.dart';
import 'package:crypto_trading_lessons/core/constants/app_constants.dart';
import 'package:crypto_trading_lessons/core/data/theme/theme_bloc.dart';
import 'package:crypto_trading_lessons/core/data/theme/theme_repository_impl.dart';
import 'package:crypto_trading_lessons/core/data/theme/theme_event.dart';
import 'package:crypto_trading_lessons/core/data/theme/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  
  const MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(
        ThemeRepositoryImpl(sharedPreferences),
      )..add(const ThemeLoaded()),
      child: const _MyAppView(),
    );
  }
}

class _MyAppView extends StatelessWidget {
  const _MyAppView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        // Determine the theme mode based on the current state
        ThemeMode themeMode = ThemeMode.light; // Default fallback
        
        if (state is ThemeLoadSuccess) {
          themeMode = state.themeMode;
        }
        
        return MaterialApp.router(
          title: AppConstants.appName,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
