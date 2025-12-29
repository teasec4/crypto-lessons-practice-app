# Architecture Overview

## Architecture Pattern

### Clean Architecture
The project follows Clean Architecture principles with clear separation of concerns:

```
Presentation Layer
       ↓
Domain Layer (Entities, Use Cases)
       ↓
Data Layer (Repositories, Data Sources)
```

## Layers

### 1. **Presentation Layer** (`/presentation`)
- **Screens** - Full-page views (LessonsScreen, WalletScreen, etc.)
- **Widgets** - Reusable UI components
- **BLoC** - State management (planned: bloc_pattern)

### 2. **Domain Layer** (`/domain`)
- **Entities** - Business logic models (Lesson, Wallet, User, etc.)
- **Repositories** - Abstract interfaces for data access
- **Use Cases** - Business logic operations (planned)

### 3. **Data Layer** (`/data`)
- **Models** - Data transfer objects (DTOs) with JSON serialization
- **Data Sources** - Remote (API), Local (Drift), Mock data
- **Repositories** - Concrete implementations

## Feature-Based Structure

Each feature is a complete vertical slice:

```
features/
├── lessons/
│   ├── domain/        # Business logic
│   ├── data/          # Data access
│   └── presentation/  # UI
├── wallet/
├── practice/
└── profile/
```

Benefits:
- Easy to scale and maintain
- Features can be developed independently
- Clear dependency graph
- Easier testing and modularization

## Technology Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| Framework | Flutter 3.10+ | Cross-platform UI |
| Routing | GoRouter 14.6.0 | Navigation & deep linking |
| State Management | BLoC (planned) | App state & business logic |
| Database | Drift/SQLite (planned) | Local data persistence |
| Theme | Material Design 3 | UI design system |
| Build | Dart-only | No external build tools |

## Navigation Architecture

- **GoRouter** with typed routes
- **ShellRoute** for tab navigation
- **Deep linking** support
- **State persistence** planned

## Design Patterns

### Used
- **Repository Pattern** - Abstract data access
- **Singleton** - App router instance
- **Provider Pattern** - Theme and routing access

### Planned
- **BLoC Pattern** - State management
- **Factory Pattern** - Data model creation
- **Observer Pattern** - Event streaming

## Future Enhancements

1. **State Management** - Implement BLoC for robust state handling
2. **Local Storage** - Drift/SQLite for data persistence
3. **Authentication** - User login/registration
4. **API Integration** - Real cryptocurrency data
5. **Real-time Updates** - WebSocket connections
