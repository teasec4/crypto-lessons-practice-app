import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// Base class for all theme-related events.
/// 
/// Theme events are dispatched to the [ThemeBloc] to trigger state changes
/// in the application's theme management system.
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load the current theme mode from persistent storage.
/// 
/// This event is typically dispatched when the application starts up
/// to restore the user's previously selected theme preference.
class ThemeLoaded extends ThemeEvent {
  const ThemeLoaded();

  @override
  String toString() => 'ThemeLoaded';
}

/// Event to change the current theme mode.
/// 
/// This event is dispatched when the user selects a new theme mode
/// through the settings UI. The new theme mode will be saved to
/// persistent storage and applied to the application.
class ThemeChanged extends ThemeEvent {
  /// The new theme mode to apply.
  final ThemeMode themeMode;

  const ThemeChanged(this.themeMode);

  @override
  List<Object?> get props => [themeMode];

  @override
  String toString() => 'ThemeChanged { themeMode: $themeMode }';
}