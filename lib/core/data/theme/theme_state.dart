import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// Base class for all theme-related states.
/// 
/// Theme states represent the current state of the theme management system
/// and are emitted by the [ThemeBloc] in response to theme events.
abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the theme system before any theme has been loaded.
/// 
/// This is the default state when the [ThemeBloc] is first created,
/// before the [ThemeLoaded] event is dispatched.
class ThemeInitial extends ThemeState {
  const ThemeInitial();

  @override
  String toString() => 'ThemeInitial';
}

/// State indicating that a theme loading operation is in progress.
/// 
/// This state is emitted when the [ThemeBloc] is loading the theme
/// preference from persistent storage.
class ThemeLoadInProgress extends ThemeState {
  const ThemeLoadInProgress();

  @override
  String toString() => 'ThemeLoadInProgress';
}

/// State indicating that a theme has been successfully loaded or changed.
/// 
/// This state contains the current [ThemeMode] that should be applied
/// to the application. It is emitted after successful theme loading
/// or when a theme change has been processed.
class ThemeLoadSuccess extends ThemeState {
  /// The current theme mode.
  final ThemeMode themeMode;

  const ThemeLoadSuccess(this.themeMode);

  @override
  List<Object?> get props => [themeMode];

  @override
  String toString() => 'ThemeLoadSuccess { themeMode: $themeMode }';
}

/// State indicating that a theme loading operation has failed.
/// 
/// This state is emitted when there's an error loading the theme
/// from persistent storage or when a theme change operation fails.
/// The application should handle this gracefully, typically by
/// falling back to a default theme.
class ThemeLoadFailure extends ThemeState {
  /// The error message describing what went wrong.
  final String error;

  const ThemeLoadFailure(this.error);

  @override
  List<Object?> get props => [error];

  @override
  String toString() => 'ThemeLoadFailure { error: $error }';
}