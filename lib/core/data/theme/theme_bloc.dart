import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';
import 'theme_state.dart';
import 'theme_repository.dart';

/// BLoC for managing theme state in the application.
/// 
/// The [ThemeBloc] handles theme-related events and manages the current
/// theme state. It integrates with [ThemeRepository] for persistent storage
/// of user theme preferences.
/// 
/// Supported events:
/// - [ThemeLoaded]: Load theme from persistent storage
/// - [ThemeChanged]: Change and save new theme mode
/// 
/// Emitted states:
/// - [ThemeInitial]: Initial state before loading
/// - [ThemeLoadInProgress]: Loading theme from storage
/// - [ThemeLoadSuccess]: Theme loaded/changed successfully
/// - [ThemeLoadFailure]: Error loading/changing theme
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository _themeRepository;

  /// Creates a [ThemeBloc] with the provided [ThemeRepository].
  /// 
  /// The bloc starts in the [ThemeInitial] state and requires a
  /// [ThemeLoaded] event to load the user's theme preference.
  ThemeBloc(this._themeRepository) : super(const ThemeInitial()) {
    on<ThemeLoaded>(_onThemeLoaded);
    on<ThemeChanged>(_onThemeChanged);
  }

  /// Handles the [ThemeLoaded] event by loading the theme from storage.
  /// 
  /// Emits [ThemeLoadInProgress] while loading, then either
  /// [ThemeLoadSuccess] with the loaded theme or [ThemeLoadFailure]
  /// if an error occurs.
  Future<void> _onThemeLoaded(
    ThemeLoaded event,
    Emitter<ThemeState> emit,
  ) async {
    emit(const ThemeLoadInProgress());
    
    try {
      final themeMode = await _themeRepository.getThemeMode();
      emit(ThemeLoadSuccess(themeMode));
    } catch (error) {
      final errorMessage = 'Failed to load theme: $error';
      if (kDebugMode) {
        print(errorMessage);
      }
      emit(ThemeLoadFailure(errorMessage));
    }
  }

  /// Handles the [ThemeChanged] event by saving and applying the new theme.
  /// 
  /// Saves the new theme mode to persistent storage via [ThemeRepository]
  /// and emits [ThemeLoadSuccess] with the new theme. If saving fails,
  /// emits [ThemeLoadFailure] but still applies the theme for the current
  /// session (graceful degradation).
  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      // Save the new theme mode to persistent storage
      await _themeRepository.setThemeMode(event.themeMode);
      
      // Emit success state with the new theme mode
      emit(ThemeLoadSuccess(event.themeMode));
    } catch (error) {
      final errorMessage = 'Failed to save theme: $error';
      if (kDebugMode) {
        print(errorMessage);
      }
      
      // Even if saving fails, we can still apply the theme for this session
      // This provides graceful degradation - the theme works now but won't persist
      emit(ThemeLoadSuccess(event.themeMode));
      
      // Note: We don't emit ThemeLoadFailure here because the theme change
      // was successful for the current session, even if persistence failed.
      // The user can still use the app with their selected theme.
    }
  }
}