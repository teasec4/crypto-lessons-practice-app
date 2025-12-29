# Quick Start Guide

## Current Project Status

✅ **MVP Complete** - v0.1.0
- Feature-based architecture (Clean Architecture)
- 4-tab navigation (Lessons, Wallet, Practice, Profile)
- 9 lessons with difficulty levels and locking system
- Virtual wallet with 5 cryptocurrencies
- Profile with achievements and progress tracking
- Material Design 3 themes (light/dark)

## Getting Up to Speed

### 1. Check Project Status
Read files in this order:
1. **PROGRESS.md** - Complete feature list and current status
2. **docs/daily.md** - Session history
3. **docs/01_architecture.md** - Architecture decisions
4. **docs/02_project_structure.md** - File organization

### 2. Understand the Codebase
```
lib/
├── main.dart                          # App entry
├── core/                              # Shared utilities
│   ├── routing/app_router.dart       # Navigation setup
│   ├── widgets/main_shell.dart       # Bottom nav shell
│   └── constants/                     # Colors, themes, constants
│
└── features/                          # Feature modules
    ├── lessons/
    ├── wallet/
    ├── practice/
    └── profile/
```

Each feature has: `domain/` (entities), `data/` (repositories), `presentation/` (screens)

## Running the App

```bash
# Get dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Run on web
flutter run -d chrome

# Run with hot reload enabled (default)
# Changes to .dart files apply instantly
```

## Key Commands

```bash
# Format code
dart format lib/

# Analyze code
dart analyze

# Run tests (when available)
flutter test

# Build APK (Android)
flutter build apk --release

# Build iOS
flutter build ios --release
```

## File Locations

| What | Where |
|------|-------|
| Navigation | `lib/core/routing/app_router.dart` |
| Themes | `lib/core/constants/app_themes.dart` |
| Colors | `lib/core/constants/app_colors.dart` |
| Screens | `lib/features/{feature}/presentation/screens/` |
| Widgets | `lib/features/{feature}/presentation/widgets/` |
| Entities | `lib/features/{feature}/domain/entities/` |
| Repositories | `lib/features/{feature}/data/` |

## Common Tasks

### Add a new route
1. Create screen in `lib/features/{feature}/presentation/screens/`
2. Add route to `lib/core/routing/app_router.dart`
3. Use `context.go('/path')` to navigate

### Add a new widget
1. Create file in `lib/features/{feature}/presentation/widgets/`
2. Import and use in screens

### Add a new feature
1. Create folder `lib/features/{new_feature}/`
2. Create subdirectories: `domain/entities/`, `data/`, `presentation/screens/`
3. Add routes to `app_router.dart`

### Update mock data
Edit repository files in `lib/features/{feature}/data/`

## Next Steps (Phase 2)

1. **BLoC Setup** - Add state management
2. **Database** - Implement Drift/SQLite
3. **Authentication** - User login/signup
4. **API Integration** - Replace mock data with real APIs

See [docs/03_release_plan.md](03_release_plan.md) for detailed roadmap.

## Documentation Map

- **[Vision & Goals](00_vision.md)** - Project objectives
- **[Architecture](01_architecture.md)** - System design
- **[Project Structure](02_project_structure.md)** - File organization
- **[Release Plan](03_release_plan.md)** - Roadmap & milestones
- **[Routing Guide](routing.md)** - Navigation details
- **[Daily Log](daily.md)** - Session history

## Troubleshooting

### Port already in use
```bash
flutter run --host localhost --dart-define=FLUTTER_APP_PORT=50050
```

### Clear cache and rebuild
```bash
flutter clean
flutter pub get
flutter run
```

### Update dependencies
```bash
flutter pub upgrade
```

## Architecture Quick Reference

- **Clean Architecture**: Presentation → Domain → Data
- **Feature-based**: Each feature is self-contained
- **Material Design 3**: Modern UI components
- **GoRouter**: Type-safe navigation
- **BLoC** (planned): State management
- **Drift** (planned): SQLite database
