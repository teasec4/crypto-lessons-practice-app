# Navigation & Routing Guide

## Overview

The app uses **GoRouter** with a **ShellRoute** pattern for tab-based navigation. All routes are defined in a centralized location for easy management and type safety.

## Route Structure

```
/ (ShellRoute - MainShell with bottom nav)
├── /lessons
│   ├── / (lessons list)
│   └── /:id (lesson detail)
├── /wallet
├── /practice
└── /profile
```

## Main Routes

| Route | Screen | Feature |
|-------|--------|---------|
| `/lessons` | LessonsScreen | Lessons feature - view and filter lessons |
| `/lessons/:id` | LessonDetailScreen | View full lesson content and progress |
| `/wallet` | WalletScreen | Wallet feature - view balance and assets |
| `/practice` | PracticeScreen | Practice feature - trading simulator |
| `/profile` | ProfileScreen | Profile feature - user stats and achievements |

## File Reference

### Configuration
**`lib/core/routing/app_router.dart`** - All routes defined here

Example structure:
```dart
final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(path: '/lessons', builder: ...),
        GoRoute(path: '/wallet', builder: ...),
        // etc.
      ],
    ),
  ],
);
```

### Navigation Shell
**`lib/core/widgets/main_shell.dart`** - Bottom navigation bar implementation

Features:
- 4 navigation tabs (Lessons, Wallet, Practice, Profile)
- Current route tracking
- Smooth tab switching
- Tab icon indicators

### Main App
**`lib/main.dart`** - App entry point

Uses `MaterialApp.router(routerConfig: appRouter)`

## Navigation Usage

### Navigate to a route
```dart
// Simple navigation
context.go('/lessons');
context.go('/wallet');
context.go('/profile');

// Navigate with parameters
context.go('/lessons/1');

// Navigate and preserve state
context.pushNamed('home');
```

### Get current route
```dart
final location = GoRouterState.of(context).uri.path;
if (location == '/lessons') {
  // User is on lessons screen
}
```

### Navigate back
```dart
context.pop();
```

### Listen to route changes
```dart
context.watch<GoRouterState>();
```

## Deep Linking

GoRouter automatically supports deep linking:
```
crypto://lessons
crypto://wallet
crypto://practice
crypto://profile
crypto://lessons/1
```

Configure in platform-specific files (iOS/Android) to handle these URIs.

## Navigation Parameters

### Pass parameters via path
```dart
// Define route with parameter
GoRoute(path: '/lessons/:id', ...)

// Navigate with parameter
context.go('/lessons/5');

// Access parameter
final id = state.pathParameters['id'];
```

### Pass data via extra
```dart
// Navigate with extra data
context.go('/lessons/5', extra: lessonObject);

// Access data
final lesson = state.extra as Lesson;
```

## Best Practices

1. **Centralize Routes** - Define all routes in `app_router.dart`
2. **Type Safety** - Use GoRouter's typed parameters
3. **Consistent Naming** - Use lowercase paths with hyphens (e.g., `/lesson-detail`)
4. **State Preservation** - GoRouter preserves widget state on navigation
5. **Prevent Duplicate Routes** - Use `go()` instead of `push()` for tabs
6. **Error Handling** - Define redirect/error handling in GoRouter

## Common Patterns

### Tab Navigation (Bottom Navigation)
```dart
// Already handled by ShellRoute + MainShell
// Tapping a tab calls context.go('/tab-name')
```

### Nested Navigation
```dart
// Example: Lessons list -> Lesson detail
// Navigate: context.go('/lessons/123')
// Routes handle nesting automatically
```

### Back Navigation
```dart
// Go back to previous route
context.pop();

// Go back with result
context.pop(true);
```

## State Management with Routing

GoRouter provides access to:
- `location` - Current route path
- `pathParameters` - Route parameters
- `queryParameters` - Query string parameters
- `extra` - Passed data objects

Example:
```dart
final state = GoRouterState.of(context);
print(state.location);  // '/lessons/5'
print(state.pathParameters['id']);  // '5'
```

## Future Enhancements

- Implement `beforeNavigate` guards for authentication
- Add analytics tracking for route changes
- Implement route transitions (animations)
- Add route transitions with custom animations
