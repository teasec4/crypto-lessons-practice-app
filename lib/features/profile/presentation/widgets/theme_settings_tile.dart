import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_trading_lessons/core/data/theme/index.dart';

/// A settings tile widget for displaying and changing the current theme mode.
/// 
/// This widget integrates with the [ThemeBloc] to display the current theme
/// mode and handle user interactions for changing the theme. It shows the
/// current theme mode as a subtitle and opens a theme selection dialog
/// when tapped.
/// 
/// Requirements covered:
/// - 3.1: Display current theme mode
/// - 3.2: Handle user interactions for theme selection
/// - 3.4: Integrate into settings UI
class ThemeSettingsTile extends StatelessWidget {
  const ThemeSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        // Determine current theme mode and subtitle text
        ThemeMode currentThemeMode = ThemeMode.light;
        String subtitle = 'Light';
        
        if (state is ThemeLoadSuccess) {
          currentThemeMode = state.themeMode;
          subtitle = _getThemeSubtitle(currentThemeMode);
        } else if (state is ThemeLoadInProgress) {
          subtitle = 'Loading...';
        } else if (state is ThemeLoadFailure) {
          subtitle = 'Error loading theme';
        }

        return ListTile(
          leading: Icon(
            currentThemeMode.icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: const Text('Theme'),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
          onTap: state is ThemeLoadSuccess 
            ? () => _showThemeSelectionDialog(context, currentThemeMode)
            : null,
        );
      },
    );
  }

  /// Returns a descriptive subtitle for the current theme mode.
  String _getThemeSubtitle(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'Light'; // Fallback to light if system somehow appears
    }
  }

  /// Shows a dialog for selecting a new theme mode.
  /// 
  /// Displays all available theme modes with their descriptions and icons.
  /// When a theme is selected, dispatches a [ThemeChanged] event to the [ThemeBloc].
  void _showThemeSelectionDialog(BuildContext context, ThemeMode currentTheme) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeModeExtension.allModes.map((themeMode) {
              final isSelected = themeMode == currentTheme;
              
              return ListTile(
                leading: Icon(
                  themeMode.icon,
                  color: isSelected 
                    ? Theme.of(context).colorScheme.primary
                    : null,
                ),
                title: Text(themeMode.displayName(context)),
                subtitle: Text(themeMode.description(context)),
                trailing: isSelected 
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : null,
                onTap: () {
                  // Close dialog first
                  Navigator.of(dialogContext).pop();
                  
                  // Dispatch theme change event
                  context.read<ThemeBloc>().add(ThemeChanged(themeMode));
                },
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}