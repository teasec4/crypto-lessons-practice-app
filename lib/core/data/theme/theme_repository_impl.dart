import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_repository.dart';
import 'theme_mode_extension.dart';

/// Concrete implementation of [ThemeRepository] using SharedPreferences
/// for persistent storage of theme preferences.
class ThemeRepositoryImpl implements ThemeRepository {
  final SharedPreferences _prefs;
  static const String _themeKey = 'theme_mode';
  
  /// Creates a [ThemeRepositoryImpl] with the provided [SharedPreferences] instance.
  ThemeRepositoryImpl(this._prefs);

  @override
  Future<ThemeMode> getThemeMode() async {
    try {
      final String? themeValue = _prefs.getString(_themeKey);
      
      if (themeValue == null) {
        // No saved preference, return light default
        return ThemeMode.light;
      }
      
      final mode = ThemeModeExtension.fromString(themeValue);
      // If system mode is somehow stored, fallback to light
      if (mode == ThemeMode.system) {
        return ThemeMode.light;
      }
      return mode;
    } catch (e) {
      // Log error and return default theme mode
      if (kDebugMode) {
        print('Error loading theme mode: $e');
      }
      return ThemeMode.light;
    }
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    try {
      await _prefs.setString(_themeKey, themeMode.storageValue);
    } catch (e) {
      // Log error but don't throw - graceful degradation
      if (kDebugMode) {
        print('Error saving theme mode: $e');
      }
      // Re-throw the error so the caller can handle it appropriately
      rethrow;
    }
  }
}