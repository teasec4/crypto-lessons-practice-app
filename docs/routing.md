# GoRouter Navigation

## Структура маршрутов

```
/lessons    → LessonsScreen
/wallet     → WalletScreen
/profile    → ProfileScreen
```

Все маршруты обернуты в **ShellRoute** с **MainShell**, который содержит:
- Bottom Navigation Bar с 3 вкладками
- Текущий экран в child

## Использование

### Навигация
```dart
// Перейти на экран
context.go('/lessons');
context.go('/wallet');
context.go('/profile');
```

### Получить текущий маршрут
```dart
final location = GoRouterState.of(context).uri.path;
```

## Файлы
- `lib/core/routing/app_router.dart` - конфигурация GoRouter
- `lib/core/widgets/main_shell.dart` - шеллл с bottom nav bar
- `lib/main.dart` - использует `MaterialApp.router`

## Преимущества
✅ Типизированные маршруты  
✅ Глубокие ссылки (deep linking)  
✅ Навигационные события  
✅ Правильное управление состоянием
