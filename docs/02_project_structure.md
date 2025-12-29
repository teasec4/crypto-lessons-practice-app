# Project Structure

## Directory Layout

```
lib/
├── main.dart                                    # App entry point
├── core/
│   ├── routing/
│   │   └── app_router.dart                     # GoRouter configuration
│   ├── widgets/
│   │   └── main_shell.dart                     # Bottom navigation shell
│   └── constants/
│       ├── app_colors.dart                     # Color palette
│       ├── app_themes.dart                     # Light/Dark themes
│       ├── app_constants.dart                  # Spacing, sizes, etc.
│       └── index.dart                          # Barrel export
│
└── features/
    ├── lessons/
    │   ├── domain/
    │   │   └── entities/
    │   │       └── lesson.dart                # Lesson entity
    │   ├── data/
    │   │   └── lesson_repository.dart         # Mock data source
    │   └── presentation/
    │       ├── screens/
    │       │   ├── lessons_screen.dart        # List view
    │       │   └── lesson_detail_screen.dart  # Detail view
    │       └── widgets/
    │           └── lesson_tile.dart           # Reusable component
    │
    ├── wallet/
    │   ├── domain/
    │   │   └── entities/
    │   │       ├── wallet.dart                # Wallet entity
    │   │       └── crypto_asset.dart          # Asset entity
    │   ├── data/
    │   │   └── wallet_repository.dart         # Mock data source
    │   └── presentation/
    │       ├── screens/
    │       │   └── wallet_screen.dart         # Main wallet view
    │       └── widgets/
    │           ├── balance_card.dart          # Balance display
    │           └── asset_item.dart            # Asset list item
    │
    ├── practice/
    │   ├── domain/
    │   │   └── entities/
    │   │       └── practice_session.dart      # Practice session entity
    │   └── presentation/
    │       └── screens/
    │           └── practice_screen.dart       # Practice simulator
    │
    └── profile/
        ├── domain/
        │   └── entities/
        │       ├── user.dart                  # User entity
        │       └── achievement.dart           # Achievement entity
        ├── data/
        │   └── profile_repository.dart        # Mock data source
        └── presentation/
            ├── screens/
            │   └── profile_screen.dart        # Profile view
            └── widgets/
                ├── profile_header.dart        # Header component
                ├── achievement_item.dart      # Achievement card
                └── settings_section.dart      # Settings group
```

## Layer Descriptions

### Core Layer (`/core`)
Shared utilities, constants, and widgets used across the entire app.

**Routing**
- `app_router.dart` - GoRouter setup with all routes and navigation

**Constants**
- `app_colors.dart` - Color palette definitions
- `app_themes.dart` - Light/Dark theme configurations
- `app_constants.dart` - Spacing, sizing, durations, etc.

**Widgets**
- `main_shell.dart` - Bottom navigation shell with 4 tabs

### Features

Each feature follows the same structure:

#### Domain (`/domain`)
- **Entities** - Pure business objects with no dependencies
- **Repositories** - Abstract interfaces for data access
- **Use Cases** (planned) - Business logic operations

#### Data (`/data`)
- **Repositories** - Concrete implementations of domain repositories
- **Data Sources** - Interfaces for different data origins (API, DB, Mock)
- **Models** - DTOs with serialization logic

#### Presentation (`/presentation`)
- **Screens** - Full-page widgets (routed)
- **Widgets** - Reusable UI components
- **BLoC** (planned) - State management

## File Naming Conventions

- **Screens**: `{name}_screen.dart`
- **Widgets**: `{name}_widget.dart` or just `{name}.dart`
- **Entities**: `{name}.dart`
- **Repositories**: `{name}_repository.dart`
- **Models**: `{name}_model.dart`
- **BLoC** (future): `{name}_bloc.dart`, `{name}_event.dart`, `{name}_state.dart`

## Routing Structure

```
/ (root)
├── /lessons
│   ├── / (list)
│   └── /:id (detail)
├── /wallet
├── /practice
└── /profile
```

All routes implement navigation via bottom tab bar (ShellRoute).

## Current Status

### ✅ Implemented
- Feature-based folder structure
- Core layer with routing and themes
- Domain entities for all features
- Data layer with mock repositories
- Presentation layer with screens and widgets
- Navigation and routing setup

### 🔄 Planned
- BLoC state management setup
- Drift SQLite database layer
- Authentication system
- Real API integration
- Database models and migrations
