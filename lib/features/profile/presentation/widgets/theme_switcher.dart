import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_trading_lessons/core/data/theme/index.dart';

/// A simple theme switcher using a Switch widget.
/// Toggles between Light and Dark themes.
class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool isDarkMode = false;
        
        if (state is ThemeLoadSuccess) {
          isDarkMode = state.themeMode == ThemeMode.dark;
        }

        return ListTile(
          leading: Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: const Text('Dark Mode'),
          subtitle: Text(isDarkMode ? 'Enabled' : 'Disabled'),
          trailing: Switch(
            value: isDarkMode,
            onChanged: (value) {
              final newThemeMode = value ? ThemeMode.dark : ThemeMode.light;
              context.read<ThemeBloc>().add(ThemeChanged(newThemeMode));
            },
          ),
        );
      },
    );
  }
}
