# Changelog

All notable changes to this project are documented in this file.

## [Unreleased]

### Planned
- BLoC state management
- Drift SQLite database
- User authentication
- Real API integration
- WebSocket for real-time prices
- Advanced trading simulator
- Analytics tracking
- Premium features

---

## [0.2.3] - 2025-12-29 (Session 5)

### Changed - Complete Lesson System + Profile Synchronization
**Lesson System Expansion:**
- Expanded from 9 to 15 lessons (5 per difficulty category)
- New Intermediate lessons: Candlestick Patterns, Support & Resistance, Volume Analysis
- New Advanced lessons: Risk Management Pro, Market Psychology, Trading Automation
- Smart unlocking: Intermediate after 5 lessons, Advanced after 10 lessons

**Difficulty Spike Feature:**
- Lesson 5 (Market Analysis) now displays as yellow/hard difficulty
- Creates visual "hook" at end of Beginner section
- Motivates progression to Intermediate content

**Progress Header Improvements:**
- Reduced bottom padding (24px → 16px)
- Added divider separator line for visual distinction
- Better visual hierarchy between header and lesson list

**Level System Rebalanced:**
- Newbie: 0-2 lessons
- Trader: 3-7 lessons (finished Beginner)
- Advanced: 8-12 lessons (finished Intermediate)
- Master: 13-14 lessons
- Legend: 15 lessons (complete)

**Profile Screen Synchronization:**
- Real-time data binding with LessonRepository
- Auto-calculating: lessonsCompleted, EXP (250/lesson), level
- 6 achievements with dynamic unlock logic
- Achievements auto-unlock based on progress milestones

**Wallet Padding Standardization:**
- Unified all paddings to AppConstants
- Removed hardcoded pixel values across all components
- Consistent spacing in locked/unlocked states

---

## [0.2.2] - 2025-12-29 (Session 4)

### Changed - Native Ads Integration & UI Enhancements
**Wallet Screen:**
- Added scale entrance animation to balance card (0.95 → 1.0 scale)
- Converted BalanceCard to StatefulWidget for animation support
- Added "Your crypto portfolio" subtitle for context
- Enhanced trending badge with green icon and border styling
- Integrated BackdropFilter for glassmorphism effect
- Added "Start Learning" button (blue gradient, school icon)
- Integrated NativeAdCard ("Ready to Trade?" offer) after balance
- Improved visual hierarchy with shadows and spacing

**Practice Screen:**
- Enhanced lock status message with orange container styling
- Added explicit "🔒 Trading Practice Locked" title
- Added "Almost there! 📚" motivational message
- Implemented vertical button + NativeAdCard layout
- Added "Continue Lessons" button (primary action)
- Integrated NativeAdCard in locked state
- Improved responsive design with SingleChildScrollView
- Better visual feedback with gradients and shadows

**Monetization:**
- Consistent native ad placement across Lessons, Practice, Wallet
- "Sponsored" label for transparency
- Non-aggressive secondary placement strategy
- Contextually relevant offers

### Technical Details
- Used `SliverToBoxAdapter` for CustomScrollView compatibility
- Scale animation with `CurvedAnimation` and `Curves.easeOutBack`
- Full-width responsive buttons (56px height, touch-friendly)
- Consistent styling with AppColors and AppConstants

---

## [0.2.1] - 2025-12-29 (Session 3)

### Changed - Wallet CTA Enhancement
**Wallet Screen:**
- Replaced custom CTA cards with button + NativeAdCard layout
- Added "Start Learning" button with gradient styling
- Improved layout structure and spacing
- Better visual hierarchy with primary/secondary actions

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
