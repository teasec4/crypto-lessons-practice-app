# Crypto Trading Lessons

A Flutter educational app that teaches cryptocurrency trading fundamentals through interactive lessons, a virtual wallet, and a trading practice simulator.

## Features

### 📚 Lessons
- 15 structured lessons (5 Beginner, 5 Intermediate, 5 Advanced)
- Categorized by difficulty level with visual indicators
- Progressive unlocking system (Intermediate after 5, Advanced after 10 lessons)
- Detailed lesson content with multi-page content system
- Progress tracking with motivating level system (Newbie → Legend)
- **Sticky progress header** with live level and completion stats
- 5th Beginner lesson highlighted in yellow as "difficulty spike"
- Native ad integration
- Lesson detail screen with visual difficulty indicators

### 💰 Wallet
- Virtual wallet with 1000+ USD starting balance
- Multi-cryptocurrency support (USDT, BTC, ETH, XRP, SOL)
- Real-time price display with 24h changes
- Animated balance card with entrance effect
- Send/Receive transaction UI
- Asset management interface
- Native ad placement for trading offers

### 🎮 Practice
- Trading simulator with unlocking requirements (5 beginner lessons)
- Gamified progression system
- Enhanced locked state messaging with "Go to Lessons" button
- Clear requirements display
- Native ad integration
- Visual hierarchy with gradients and shadows

### 👤 Profile
- User level and experience (EXP) tracking (250 EXP per lesson)
- Achievement system with 6 achievements, auto-unlocking based on progress
- Progress visualization synced with actual lesson completion
- Settings management (Preferences, Security, General)
- User preferences and notification toggle
- **Synchronized achievements:**
  - 🚀 First Step (1+ lesson)
  - 📚 Quick Learner (5+ lessons)
  - 🏆 Trading Master (10+ lessons)
  - ⭐ Legendary Trader (all 15 lessons)
  - 📈 Intermediate Path (5+ lessons)
  - 🎯 Advanced Mastery (10+ lessons)

### 🎯 Monetization
- Native ad cards with "Sponsored" label for transparency
- Integrated in Lessons, Practice, and Wallet screens
- Non-intrusive secondary placements
- Contextually relevant offers

## Tech Stack

- **Framework:** Flutter 3.10+
- **Architecture:** Clean Architecture + Feature-based
- **Navigation:** GoRouter 14.6.0
- **Theme:** Material Design 3 with Light/Dark support
- **State Management:** BLoC (planned)
- **Database:** Drift/SQLite (planned)
- **Animations:** Built-in Flutter animations (scale, opacity, transitions)

## Project Structure

See [docs/02_project_structure.md](docs/02_project_structure.md) for detailed structure.

## Getting Started

### Prerequisites
- Flutter 3.10+
- Dart 3.0+

### Installation
```bash
git clone https://github.com/teasec4/crypto-lessons-practice-app.git
cd crypto_trading_lessons
flutter pub get
flutter run
```

## Documentation

- [Vision & Goals](docs/00_vision.md) - Project vision and objectives
- [Architecture](docs/01_architecture.md) - System architecture overview
- [Project Structure](docs/02_project_structure.md) - Detailed file structure
- [Release Plan](docs/03_release_plan.md) - Roadmap and milestones
- [Quick Start](docs/QUICK_START.md) - Development quick reference
- [Routing Guide](docs/routing.md) - Navigation structure

## Progress

See [PROGRESS.md](PROGRESS.md) for detailed progress tracking and completed features.

## Roadmap

### Phase 1 (MVP) - ✅ Complete
- Feature-based architecture
- 4-tab navigation (Lessons, Wallet, Practice, Profile)
- Lesson system with categories and locking
- Virtual wallet with multi-asset support
- Achievement system
- Progress tracking

### Phase 1.5 (UI Polish + Monetization) - ✅ Complete
- Motivating level system (Newbie → Legend)
- Enhanced lesson tiles with gradient backgrounds
- Animated balance card with entrance effect
- Native ad integration (Lessons, Wallet, Practice)
- Improved visual hierarchy and spacing

### Phase 2 (In Progress)
- [ ] BLoC state management
- [ ] Drift SQLite database
- [ ] User authentication
- [ ] Real API integration

### Phase 3 (Future)
- [ ] WebSocket for real-time prices
- [ ] Advanced trading simulator
- [ ] Local notifications
- [ ] Data persistence
- [ ] Analytics tracking
- [ ] Premium features

## License

This project is open source and available under the MIT License.
