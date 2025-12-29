# Quick Start для новых сессий

## Что сейчас готово
✅ Архитектура проекта (Clean + Feature-based)  
✅ Navigation (GoRouter + Bottom tabs)  
✅ 3 экрана (Lessons, Wallet, Profile)  

## Проверить статус
Смотри файлы в этом порядке:
1. **PROGRESS.md** - общее состояние проекта
2. **docs/daily.md** - что было сделано в каждый день
3. **docs/01_architecture.md** - архитектурные решения

## Быстрый старт разработки
```bash
# Получить зависимости
flutter pub get

# Запустить приложение
flutter run

# Смотреть изменения в реал-тайме
flutter run -d chrome  # Для web тестирования
```

## Файлы для редактирования
- **Экраны:** `lib/features/*/presentation/screens/`
- **Маршруты:** `lib/core/routing/app_router.dart`
- **Компоненты:** `lib/core/widgets/`

## Что дальше?
1. **Приоритет:** Добавить BLoC для state management
2. **Потом:** Модели User и Drift database
3. **Затем:** Заполнить экраны контентом
