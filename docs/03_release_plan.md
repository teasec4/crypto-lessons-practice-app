# Release Plan & Roadmap

## Phase 1: MVP (v0.1.0) - ✅ COMPLETE

### Core Features
- [x] Feature-based architecture
- [x] 4-tab navigation (Lessons, Wallet, Practice, Profile)
- [x] Lesson system with categories (Beginner, Intermediate, Advanced)
- [x] Lesson difficulty levels (Easy, Medium, Hard)
- [x] Lesson locking system (prerequisites)
- [x] Virtual wallet with multi-asset support
- [x] Achievement system with visual indicators
- [x] User profile with level tracking
- [x] Material Design 3 themes (light/dark)
- [x] Deep linking support

### Completion Status
- **9 Lessons** - Fully implemented
- **5 Cryptocurrencies** - USDT, BTC, ETH, XRP, SOL
- **6 Achievements** - Various unlock conditions
- **User Stats** - Level, EXP, Progress

---

## Phase 2: State Management & Persistence (v0.2.0) - IN PROGRESS

### Core Requirements
- [ ] **BLoC Setup**
  - [ ] LessonBloc - Manage lesson list and detail states
  - [ ] WalletBloc - Manage wallet and assets
  - [ ] UserBloc - Manage profile and progress
  - [ ] AuthBloc - Authentication state (planned)

- [ ] **Local Database**
  - [ ] Drift/SQLite setup
  - [ ] Database schema design
  - [ ] Migration system
  - [ ] Data persistence for:
    - User progress
    - Lesson completion status
    - Wallet state
    - Achievements

### Timeline
- **Week 1**: BLoC architecture and setup
- **Week 2**: Drift database implementation
- **Week 3**: Data migration and persistence

---

## Phase 3: Authentication & API (v0.3.0)

### Features
- [ ] User authentication system
  - [ ] Signup/Login UI
  - [ ] Email verification
  - [ ] Password reset
  - [ ] Session management

- [ ] Real API Integration
  - [ ] CoinGecko API for crypto prices
  - [ ] User backend service
  - [ ] Progress sync
  - [ ] Achievement verification

- [ ] API Service Layer
  - [ ] HTTP client setup
  - [ ] Error handling
  - [ ] Retry logic
  - [ ] Rate limiting

### Estimated Timeline
- **1-2 months** after Phase 2 completion

---

## Phase 4: Advanced Features (v1.0.0)

### Trading Simulator
- [ ] Order placement UI
- [ ] Market simulation engine
- [ ] P&L calculation
- [ ] Order history

### Real-time Updates
- [ ] WebSocket integration
- [ ] Real-time price streaming
- [ ] Push notifications

### Advanced Features
- [ ] Portfolio analytics
- [ ] Trading history export
- [ ] Advanced charting
- [ ] Risk calculator
- [ ] Multi-language support

### Estimated Timeline
- **2-3 months** after Phase 3 completion

---

## Phase 5: Polish & Release (v1.1.0)

### Quality Assurance
- [ ] Comprehensive testing
- [ ] Performance optimization
- [ ] Accessibility review
- [ ] Beta testing program

### Release Activities
- [ ] App Store submission
- [ ] Google Play submission
- [ ] Marketing materials
- [ ] Documentation finalization

### Estimated Timeline
- **1 month** after Phase 4

---

## Milestone Summary

| Version | Status | Target | Features |
|---------|--------|--------|----------|
| 0.1.0 | ✅ Done | 2025-12-29 | MVP with UI and mock data |
| 0.2.0 | 🔄 WIP | 2026-01-15 | BLoC + Database |
| 0.3.0 | 📋 Planned | 2026-02-15 | Auth + Real API |
| 1.0.0 | 📋 Planned | 2026-04-15 | Trading simulator + Advanced |
| 1.1.0 | 📋 Planned | 2026-05-15 | Polish + App Store release |

---

## Success Metrics

- **Phase 1**: UI completeness and navigation stability
- **Phase 2**: Data persistence and state management reliability
- **Phase 3**: Authentication flow and API integration stability
- **Phase 4**: Trading simulator engagement and accuracy
- **Phase 5**: App Store ratings and user retention

---

## Known Limitations

### Current (MVP)
- Mock data only (no persistence)
- No user authentication
- No real-time data
- Static achievement system

### Phase 2
- Will address mock data limitation
- Still no real authentication

### Phase 3+
- Will implement real user management
- Will add real-time features
