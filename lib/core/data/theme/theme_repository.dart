import 'package:flutter/material.dart';

/// Abstract repository interface for theme persistence operations.
/// 
/// This repository handles saving and loading user theme preferences
/// using SharedPreferences for persistent storage across app sessions.
abstract class ThemeRepository {
  /// Loads the saved theme mode from persistent storage.
  /// 
  /// Returns the user's previously selected theme mode, or [ThemeMode.system]
  /// as the default if no preference has been saved.
  /// 
  /// Throws an exception if there's an error accessing storage.
  Future<ThemeMode> getThemeMode();

  /// Saves the selected theme mode to persistent storage.
  /// 
  /// [themeMode] The theme mode to save (light, dark, or system).
  /// 
  /// Throws an exception if there's an error writing to storage.
  Future<void> setThemeMode(ThemeMode themeMode);
}