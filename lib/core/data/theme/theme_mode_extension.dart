import 'package:flutter/material.dart';

/// Extension on [ThemeMode] to provide utility methods for display names,
/// storage values, and string conversion.
extension ThemeModeExtension on ThemeMode {
  /// Returns a human-readable display name for the theme mode.
  /// 
  /// Uses localized strings when [context] is provided, otherwise falls back
  /// to English names.
  String displayName([BuildContext? context]) {
    // TODO: Add proper localization when flutter_localizations is added
    // For now, return English names as fallback
    switch (this) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
  
  /// Returns a human-readable display name for the theme mode (deprecated).
  /// 
  /// Use [displayName] method instead for better localization support.
  @Deprecated('Use displayName([BuildContext? context]) instead')
  String get displayNameLegacy {
    switch (this) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
  
  /// Returns the string value used for storage persistence.
  String get storageValue {
    switch (this) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
  
  /// Returns a localized description for the theme mode.
  /// 
  /// Provides more detailed information about what each theme mode does.
  String description([BuildContext? context]) {
    // TODO: Add proper localization when flutter_localizations is added
    // For now, return English descriptions as fallback
    switch (this) {
      case ThemeMode.light:
        return 'Always use light theme';
      case ThemeMode.dark:
        return 'Always use dark theme';
      case ThemeMode.system:
        return 'Follow system settings';
    }
  }
  
  /// Returns an icon that represents this theme mode.
  IconData get icon {
    switch (this) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.settings_brightness;
    }
  }
  
  /// Returns whether this theme mode will result in a dark theme
  /// given the current system brightness.
  bool isDark(BuildContext context) {
    switch (this) {
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
      case ThemeMode.system:
        return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
  }
  
  /// Creates a [ThemeMode] from a string value.
  /// 
  /// Returns [ThemeMode.system] as the default for unknown values.
  static ThemeMode fromString(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
  
  /// Returns all available theme modes for UI selection.
  static List<ThemeMode> get allModes => [
    ThemeMode.light,
    ThemeMode.dark,
  ];
}