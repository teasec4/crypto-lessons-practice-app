# Changelog

Все значительные изменения в проекте документируются в этом файле.

## [Unreleased]

### Planned
- BLoC state management
- Drift SQLite database
- User authentication
- Real API integration
- WebSocket for real-time prices
- Advanced trading simulator

---

## [0.1.1] - 2025-12-29 (Session 2)

### Changed - UI Polish & Gamification
**Lessons Screen:**
- Replaced static progress percentage with motivating level system
- Added 5 levels with emoji: Newbie 📱 → Trader 📈 → Advanced 🚀 → Master 👑 → Legend ⭐
- Improved progress bar height and visibility
- Added level indicators with lesson count display

**Lesson Tiles:**
- Enhanced visual design with gradients and shadows
- Implemented smart navigation flow:
  - ✅ Completed lessons: Green checkmark, full color
  - 🔵 Current lesson: Bright "Start" button with blue gradient and double shadow
  - 🔒 Locked lessons: Grey "Locked" button with lock icon
- Improved color contrast (greyed text for incomplete lessons)
- Better button padding and sizing for better touch targets

**Practice Screen:**
- Complete redesign of locked state with warning messaging
- Added clear "You must complete all Beginner lessons" requirement box (orange styling)
- Implemented "Go to Lessons" button with school icon for easy navigation
- Added lock icon (🔒) to reinforce locked state
- Improved progress visualization with progress counter badge
- Better mobile support with SingleChildScrollView

**Repository:**
- Added `getCurrentLessonId()` method to track current lesson progression
- Mock progression: Lessons 1-3 completed, 4 in progress, 5-9 locked

### Visual Improvements
- Gradient LinearGradient implementations throughout UI
- Double BoxShadow for depth perception
- Better emoji integration for visual communication
- Consistent padding and spacing across components
- Improved icon sizing (larger, more visible)
- Better color hierarchy and contrast ratios

---

## [0.1.0] - 2025-12-29

### Added - MVP Complete
- Feature-based architecture with 4 main features (Lessons, Wallet, Practice, Profile)
- GoRouter navigation with ShellRoute and bottom navigation
- Material Design 3 themes with light/dark support
- **Lessons Feature:**
  - 9 lessons with 3 difficulty categories
  - Lesson entity with difficulty levels (Easy, Medium, Hard)
  - Expandable category-based lesson list
  - Lesson detail screen with content sections
  - Progressive unlocking system (Intermediate/Advanced require prerequisites)
  - Progress tracking with completion indicators
- **Wallet Feature:**
  - Virtual wallet with 1000+ USD starting balance
  - 5 cryptocurrency assets (USDT, BTC, ETH, XRP, SOL)
  - MetaMask-style balance card with gradient design
  - Send/Receive action buttons UI
  - Asset list with price, balance, and 24h change display
- **Practice Feature:**
  - Unlocking requirements (5 beginner lessons completion)
  - Locked/unlocked state management
  - Gamification messaging
- **Profile Feature:**
  - User entity with level, EXP, and progress
  - Achievement system with 6 mock achievements
  - Achievement grid with locked/unlocked states
  - Profile header with stats and progress bar
  - Settings sections (Preferences, Security, General)
  - Notification toggle and preference management
- **Navigation:**
  - 4-tab bottom navigation (Lessons, Wallet, Practice, Profile)
  - GoRouter with typed routes and deep linking
  - Nested routing for lesson details (/lessons/:id)
  - No-transition page navigation

### Project Setup
- Clean Architecture + Feature-based structure
- Consistent color palette and design system
- Mock data repository for lessons
- Dart-only implementation (minimal dependencies)

---

## [0.0.1] - 2025-12-28

### Initial Setup
- Project creation with Flutter template
- Basic folder structure
- Initial documentation
