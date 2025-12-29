# Crypto Trading Lessons

A Flutter educational app that teaches cryptocurrency trading fundamentals through interactive lessons, a virtual wallet, and a trading practice simulator.

## Features

### 📚 Lessons
- 9 structured lessons (5 Beginner, 2 Intermediate, 2 Advanced)
- Categorized by difficulty level
- Progressive unlocking system based on prerequisites
- Detailed lesson content with visual difficulty indicators
- Progress tracking per lesson

### 💰 Wallet
- Virtual wallet with 1000+ USD starting balance
- Multi-cryptocurrency support (USDT, BTC, ETH, XRP, SOL)
- Real-time price display with 24h changes
- Send/Receive transaction UI
- Asset management interface

### 🎮 Practice
- Trading simulator with unlocking requirements
- Gamified progression system
- Unlocks after completing 5 beginner lessons
- Interactive trading experience with mock market data

### 👤 Profile
- User level and experience (EXP) tracking
- Achievement system with visual indicators
- Progress visualization
- Settings management
- User preferences and security options

## Tech Stack

- **Framework:** Flutter 3.10+
- **Architecture:** Clean Architecture + Feature-based
- **Navigation:** GoRouter 14.6.0
- **Theme:** Material Design 3 with Light/Dark support
- **State Management:** BLoC (planned)
- **Database:** Drift/SQLite (planned)

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

## License

This project is open source and available under the MIT License.
