# Implementation Plan: Theme Switcher

## Overview

Реализация переключателя темы с использованием BLoC паттерна и SharedPreferences для сохранения пользовательских предпочтений в Flutter приложении Crypto Trading Lessons.

## Tasks

- [x] 1. Добавить зависимости и настроить проект
  - Добавить flutter_bloc и shared_preferences в pubspec.yaml
  - Обновить зависимости проекта
  - _Requirements: 4.1, 4.2_

- [x] 2. Создать Theme Repository слой
  - [x] 2.1 Создать абстрактный ThemeRepository интерфейс
    - Определить методы getThemeMode() и setThemeMode()
    - _Requirements: 2.1, 2.2_

  - [x] 2.2 Реализовать ThemeRepositoryImpl с SharedPreferences
    - Реализовать сохранение и загрузку ThemeMode
    - Добавить обработку ошибок и значения по умолчанию
    - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5_

  - [ ]* 2.3 Написать property тест для Theme Repository
    - **Property 1: Theme Persistence Round Trip**
    - **Validates: Requirements 2.1, 2.2**

  - [ ]* 2.4 Написать unit тесты для обработки ошибок
    - Тестировать graceful обработку ошибок SharedPreferences
    - _Requirements: 2.4, 2.5_

- [-] 3. Создать ThemeMode расширения
  - [x] 3.1 Добавить ThemeModeExtension с методами конвертации
    - Реализовать displayName, storageValue, fromString методы
    - Добавить поддержку локализации названий тем
    - _Requirements: 1.4, 2.1_

  - [ ]* 3.2 Написать unit тесты для ThemeMode расширений
    - Тестировать корректность конвертации строк
    - _Requirements: 1.4_

- [x] 4. Реализовать Theme BLoC
  - [x] 4.1 Создать Theme Events классы
    - Определить ThemeEvent, ThemeLoaded, ThemeChanged
    - _Requirements: 4.1, 4.3_

  - [x] 4.2 Создать Theme States классы
    - Определить ThemeState, ThemeInitial, ThemeLoadInProgress, ThemeLoadSuccess, ThemeLoadFailure
    - _Requirements: 4.1, 1.2_

  - [x] 4.3 Реализовать ThemeBloc с бизнес-логикой
    - Обработка ThemeLoaded и ThemeChanged событий
    - Интеграция с ThemeRepository для persistence
    - _Requirements: 1.1, 1.2, 1.3, 4.3, 4.4_

  - [ ]* 4.4 Написать property тест для BLoC
    - **Property 2: BLoC State Emission**
    - **Validates: Requirements 1.2, 4.3**

  - [ ]* 4.5 Написать property тест для поддержки режимов темы
    - **Property 3: Theme Mode Support**
    - **Validates: Requirements 1.4**

- [ ] 5. Checkpoint - Убедиться что все тесты проходят
  - Убедиться что все тесты проходят, спросить пользователя если возникают вопросы.

- [x] 6. Интегрировать BLoC в приложение
  - [x] 6.1 Обновить main.dart для предоставления ThemeBloc
    - Добавить BlocProvider на уровне приложения
    - Инициализировать ThemeRepository с SharedPreferences
    - _Requirements: 4.2_

  - [x] 6.2 Обновить MaterialApp для использования BLoC состояния
    - Использовать BlocBuilder для реактивного обновления темы
    - Интегрировать с существующими AppThemes
    - _Requirements: 1.2, 1.3, 5.1, 5.3_

  - [ ]* 6.3 Написать property тест для интеграции приложения
    - **Property 7: Theme Application Consistency**
    - **Validates: Requirements 5.1**

- [x] 7. Создать UI для переключателя темы
  - [x] 7.1 Создать ThemeSettingsTile виджет
    - Отображение текущего режима темы
    - Обработка пользовательских взаимодействий
    - _Requirements: 3.1, 3.2, 3.4_

  - [x] 7.2 Интегрировать переключатель в ProfileScreen
    - Добавить в секцию "Preferences" настроек
    - Обеспечить правильное позиционирование
    - _Requirements: 3.4_

  - [ ]* 7.3 Написать widget тесты для UI компонентов
    - Тестировать отображение и взаимодействие
    - _Requirements: 3.1, 3.2, 3.3_

  - [ ]* 7.4 Написать property тест для UI синхронизации
    - **Property 5: UI State Synchronization**
    - **Validates: Requirements 3.1, 3.3**

- [ ] 8. Добавить диалог выбора темы
  - [ ] 8.1 Создать ThemeSelectionDialog
    - Отображение всех доступных режимов (Light, Dark, System)
    - Показ текущей системной темы для System режима
    - _Requirements: 3.2, 3.5_

  - [ ] 8.2 Интегрировать диалог с ThemeSettingsTile
    - Открытие диалога при нажатии на переключатель
    - Отправка ThemeChanged событий в BLoC
    - _Requirements: 3.2, 3.3_

  - [ ]* 8.3 Написать integration тесты для диалога
    - Тестировать полный flow выбора темы
    - _Requirements: 3.2, 3.3, 3.5_

- [ ] 9. Финальная интеграция и тестирование
  - [ ]* 9.1 Написать property тест для реактивных обновлений
    - **Property 8: Reactive UI Updates**
    - **Validates: Requirements 5.3**

  - [ ]* 9.2 Написать property тест для обработки ошибок
    - **Property 4: Error Handling Gracefully**
    - **Validates: Requirements 2.4, 2.5**

  - [ ]* 9.3 Написать integration тесты для полного flow
    - Тестировать сценарий от выбора темы до сохранения
    - _Requirements: 1.1, 1.2, 2.1, 3.3_

- [ ] 10. Финальный checkpoint - Убедиться что все тесты проходят
  - Убедиться что все тесты проходят, спросить пользователя если возникают вопросы.

## Notes

- Задачи помеченные `*` являются опциональными и могут быть пропущены для более быстрого MVP
- Каждая задача ссылается на конкретные требования для отслеживания
- Checkpoints обеспечивают инкрементальную валидацию
- Property тесты валидируют универсальные свойства корректности
- Unit тесты валидируют конкретные примеры и граничные случаи