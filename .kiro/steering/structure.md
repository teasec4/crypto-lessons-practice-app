# Project Structure & Organization

## Architecture Pattern
Clean Architecture with feature-based organization following the principle:
```
Presentation Layer → Domain Layer → Data Layer
```

## Directory Structure
```
lib/
├── main.dart                    # App entry point
├── core/                        # Shared utilities and constants
│   ├── constants/              # App-wide constants
│   ├── routing/                # GoRouter configuration
│   └── widgets/                # Shared UI components
└── features/                   # Feature modules
    ├── lessons/
    ├── wallet/
    ├── practice/
    └── profile/
```

## Feature Module Structure
Each feature follows identical organization:
```
feature_name/
├── domain/
│   └── entities/               # Business logic models
├── data/
│   └── repositories/           # Data access implementations
└── presentation/
    ├── screens/                # Full-page views
    └── widgets/                # Feature-specific components
```

## File Naming Conventions
- **Screens**: `{name}_screen.dart`
- **Widgets**: `{name}.dart` or `{name}_widget.dart`
- **Entities**: `{name}.dart`
- **Repositories**: `{name}_repository.dart`
- **Constants**: `app_{category}.dart`

## Core Layer Guidelines
- **Constants**: Use abstract classes with static members
- **Themes**: Material Design 3 with light/dark variants
- **Routing**: GoRouter with typed routes and ShellRoute for tabs
- **Widgets**: Reusable components shared across features

## Feature Development Rules
1. **Self-contained**: Each feature should be independent
2. **Clean dependencies**: Domain → Data, Presentation → Domain
3. **Mock data**: Use repository pattern with mock implementations
4. **Consistent UI**: Follow Material Design 3 patterns

## Navigation Structure
- **Shell Route**: Bottom tab navigation (4 tabs)
- **Nested Routes**: Lessons have detail and content sub-routes
- **No Transitions**: Use `NoTransitionPage` for tab switches
- **Deep Linking**: All routes support direct navigation

## Current Implementation Status
- ✅ Feature-based structure established
- ✅ Core layer with constants and routing
- ✅ Domain entities for all features
- ✅ Mock data repositories
- ✅ Presentation screens and widgets
- 🔄 BLoC state management (planned)
- 🔄 Database layer with Drift (planned)

## Code Organization Best Practices
- Use barrel exports (`index.dart`) for constants
- Keep widgets focused and single-purpose
- Prefer composition over inheritance
- Use `const` constructors for performance
- Follow Clean Architecture dependency rules