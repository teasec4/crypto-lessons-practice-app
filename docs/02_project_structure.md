# Project Structure

```
lib/
├── main.dart                          # App entry point
├── core/
│   ├── widgets/
│   │   └── main_navigation.dart       # Bottom tab bar navigation
│   ├── models/                        # Shared models
│   ├── services/                      # Shared services
│   └── constants/                     # App constants
├── features/
│   ├── lessons/
│   │   ├── presentation/
│   │   │   ├── screens/
│   │   │   │   └── lessons_screen.dart
│   │   │   ├── widgets/
│   │   │   └── bloc/                  # Bloc for state management
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── repositories/
│   │   └── data/
│   │       ├── models/
│   │       ├── datasources/
│   │       └── repositories/
│   ├── wallet/
│   │   ├── presentation/
│   │   │   ├── screens/
│   │   │   │   └── wallet_screen.dart
│   │   │   ├── widgets/
│   │   │   └── bloc/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── repositories/
│   │   └── data/
│   │       ├── models/
│   │       ├── datasources/
│   │       └── repositories/
│   └── profile/
│       ├── presentation/
│       │   ├── screens/
│       │   │   └── profile_screen.dart
│       │   ├── widgets/
│       │   └── bloc/
│       ├── domain/
│       │   ├── entities/
│       │   └── repositories/
│       └── data/
│           ├── models/
│           ├── datasources/
│           └── repositories/
```

## Архитектура
- **Clean Architecture** - разделение на presentation, domain, data
- **Feature-based** - каждая фича в отдельной папке
- **BLoC для state management** - будет добавлено
- **Drift для БД** - будет добавлено

## Текущее состояние
✅ Структура папок создана  
✅ Bottom navigation bar с 3 вкладками  
⏳ Настройка BLoC  
⏳ Настройка Drift для БД  
⏳ Модели User
