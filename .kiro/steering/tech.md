# Technology Stack & Build System

## Core Technologies
- **Framework**: Flutter 3.10+ with Dart 3.0+
- **Architecture**: Clean Architecture with feature-based organization
- **Navigation**: GoRouter 14.6.0 for type-safe routing
- **UI**: Material Design 3 with light/dark theme support
- **State Management**: Currently stateful widgets, BLoC pattern planned for Phase 2

## Dependencies
### Production
- `cupertino_icons: ^1.0.8` - iOS-style icons
- `go_router: ^14.6.0` - Declarative routing

### Development
- `flutter_lints: ^6.0.0` - Recommended linting rules
- `flutter_test` - Testing framework

## Planned Integrations (Phase 2)
- **State Management**: BLoC pattern with flutter_bloc
- **Database**: Drift/SQLite for local data persistence
- **Authentication**: User login/registration system
- **API Integration**: Real cryptocurrency data feeds
- **Real-time Updates**: WebSocket connections for live prices

## Common Commands

### Development
```bash
# Get dependencies
flutter pub get

# Run app (debug mode)
flutter run

# Run on specific device
flutter run -d chrome
flutter run -d macos

# Hot reload is automatic in debug mode
```

### Code Quality
```bash
# Analyze code for issues
flutter analyze

# Format code
dart format .

# Run tests
flutter test
```

### Build & Release
```bash
# Build for production
flutter build apk --release          # Android APK
flutter build appbundle --release    # Android App Bundle
flutter build ios --release          # iOS
flutter build web --release          # Web
flutter build macos --release        # macOS

# Clean build artifacts
flutter clean
```

### Debugging
```bash
# Run with verbose logging
flutter run --verbose

# Profile performance
flutter run --profile

# Debug inspector
flutter inspector
```

## Code Style & Linting
- Uses `package:flutter_lints/flutter.yaml` for recommended Flutter lints
- Follow standard Dart formatting conventions
- Material Design 3 components preferred over custom widgets
- Consistent use of `const` constructors for performance