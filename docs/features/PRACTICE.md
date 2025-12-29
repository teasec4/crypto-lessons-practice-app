# Practice Feature

Trading simulator with progression-based unlocking.

## Overview

Practice screen allows users to engage in a virtual trading simulator. The simulator is locked until users complete 5 beginner lessons, creating a learning path: Learn → Practice → Trade.

## Current State

### Status
- **UI:** ✅ Complete (locked/unlocked states)
- **Simulator Logic:** ⏳ Placeholder (ready for implementation)
- **Unlocking:** ✅ Working (5 lesson requirement)
- **Monetization:** ✅ Native ads integrated

### Mock Data
- `const lessonsCompleted = 3;`
- `const requiredLessons = 5;`
- Unlocked: false (until 5+ lessons completed)

---

## Features

### Locked State (0-4 lessons completed)
Shows when user hasn't completed 5 beginner lessons yet.

**Layout:**
1. **Progress Section** (top, always visible)
   - "Your Progress" title
   - Completed/Required count (e.g., "3/5 lessons")
   - Progress bar (visual progress indicator)
   - Percentage complete

2. **Lock Status Message** (middle)
   - Lock icon (🔒)
   - Title: "🔒 Trading Practice Locked"
   - Message: "Almost there! 📚"
   - Requirement text: "Complete X more lessons..."

3. **Call-to-Action** (bottom)
   - "Continue Lessons" button → navigate to /lessons
   - Native ad card → monetization opportunity

**Design:**
- Calming colors (no aggressive orange)
- Encouraging emoji and tone
- Clear path to unlock (go to lessons)
- Transparent about requirements

### Unlocked State (5+ lessons completed)
Full trading simulator interface.

**Layout:**
1. **Header** — "Trading Simulator" title
2. **Info Card** — Feature overview
   - 🚀 Ready to Trade message
   - Description of simulator features
   - Visual styling with gradient

3. **Feature List** — Wrap layout of features
   - Trade crypto pairs
   - Test strategies
   - Learn without risk
   - Track results

4. **Action Button** — "Start Trading" CTA
   - Full width (56px height)
   - Blue gradient
   - Double shadow
   - On tap → would open trading interface

5. **Trading Interface** (future)
   - Current implementation: placeholder
   - Plan: Real buy/sell interface with virtual money

---

## Architecture

### Screen Component
```dart
// lib/features/practice/presentation/screens/practice_screen.dart
class PracticeScreen extends StatelessWidget {
  // Mock unlocking logic
  bool get isUnlocked => lessonsCompleted >= requiredLessons;
  
  // Two layouts: unlocked or locked
  _UnlockedContent()
  _LockedContent()
}
```

### State (Current)
- Local constants for mock data
- No persistence (restarts reset state)

### State (Planned)
- Read from shared UserState/BLoC
- Get real `lessonsCompleted` from profile
- Sync with database

---

## UI Components

### Locked State Layout
```
┌─────────────────────────────────┐
│   Your Progress                 │
│   3/5 lessons - 60% complete    │
│   ████░░░░░░░░░░░░░░░░░░░░░░│
├─────────────────────────────────┤
│  🔒 Trading Practice Locked     │
│  Almost there! 📚               │
│  Complete 2 more lessons        │
│  [Why practice first?]          │
├─────────────────────────────────┤
│  [ Continue Lessons →  ]        │
│  [ Ready to Trade? Ad ]         │
└─────────────────────────────────┘
```

### Unlocked State Layout
```
┌─────────────────────────────────┐
│  Trading Simulator              │
├─────────────────────────────────┤
│  🚀 Ready to Trade              │
│  Practice real trading with ... │
│  • Trade crypto pairs           │
│  • Test strategies              │
│  • Learn without risk           │
├─────────────────────────────────┤
│  [ Start Trading →  ]           │
│  [ Ready to Trade? Ad ]         │
└─────────────────────────────────┘
```

---

## Navigation

### Routes
```dart
/practice → PracticeScreen (tab 3)
```

### Navigation Flow
- **From lessons:** User completes 5 lessons → Practice auto-unlocks
- **From practice:** "Continue Lessons" button → `/lessons`
- **To trading:** "Start Trading" button → (future: trading interface)

### Integration
- Bottom nav bar (tab 3)
- NoTransitionPage (smooth switching)

---

## Monetization

### Native Ads Integration

**Placement:** Below CTA buttons
- Shows in both locked and unlocked states
- Consistent messaging: "Ready to Trade?" / "Boost Your Trading"
- Component: NativeAdCard from core/widgets/

**Lock State Ads:**
- Message: "Boost Your Trading"
- Description: "Upgrade to Pro and unlock advanced strategies..."
- Button: "Explore Premium"
- Purpose: Drive premium feature interest

**Unlocked State Ads:**
- Message: "Advanced Trading Tools"
- Description: "Take your practice trading to the next level..."
- Button: "Learn More"
- Purpose: Introduce premium features

---

## State Management

### Current (Session 4)
```dart
const lessonsCompleted = 3;
const requiredLessons = 5;
final isUnlocked = lessonsCompleted >= requiredLessons;
```

**Issues:**
- Hard-coded values
- No persistence
- Not synced with lessons progress

### Planned (Phase 2)
```dart
// With BLoC/Provider
final userBloc = context.read<UserBloc>();
final lessonsCompleted = userBloc.state.lessonsCompleted;
final isUnlocked = lessonsCompleted >= 5;
```

**Benefits:**
- Single source of truth
- Synced across app
- Persistent storage
- User-specific data

---

## Future Implementation

### Phase 2: Basic Simulator
1. **Buy/Sell Interface**
   - Asset list
   - Current price display
   - Buy/Sell buttons
   - Quantity input

2. **Virtual Wallet**
   - $10,000 starting balance
   - Update on trades
   - Sync with Wallet screen

3. **Trade History**
   - Log of all transactions
   - Entry/exit prices
   - Profit/loss calculation
   - Performance metrics

### Phase 3: Advanced Simulator
- Real-time price data (WebSocket)
- Multiple trading pairs
- Advanced order types (limit, stop-loss)
- Portfolio analysis
- Performance metrics
- Leaderboard

### Phase 4: Gamification
- Achievement system (profitable trades, streak, etc.)
- Daily challenges
- Tournament mode
- User rankings

---

## Key Files

### Screen
- `lib/features/practice/presentation/screens/practice_screen.dart`

### Widgets
- `lib/core/widgets/native_ad_card.dart` (shared monetization)

### Future
- `lib/features/practice/data/trading_repository.dart` (Phase 2)
- `lib/features/practice/domain/entities/trade.dart` (Phase 2)
- `lib/features/practice/presentation/screens/trading_interface_screen.dart` (Phase 2)

---

## Code Patterns

### Mock Data
```dart
const lessonsCompleted = 3;
const requiredLessons = 5;
final isUnlocked = lessonsCompleted >= requiredLessons;
```

### Conditional UI
```dart
isUnlocked ? _UnlockedContent() : _LockedContent()
```

### Button with Navigation
```dart
ElevatedButton(
  onPressed: () => context.go('/lessons'),
  child: Text('Continue Lessons'),
)
```

---

## Testing

### Test Cases
- [ ] Unlocked state shows when lessons >= 5
- [ ] Locked state shows when lessons < 5
- [ ] Progress bar displays correctly
- [ ] "Continue Lessons" navigates to /lessons
- [ ] "Start Trading" opens simulator (when implemented)
- [ ] Ads display in both states
- [ ] Native ad buttons work

### Manual Testing Checklist
- [ ] With 3 lessons: Locked state appears
- [ ] With 5+ lessons: Unlocked state appears
- [ ] Progress bar at correct percentage
- [ ] All buttons clickable and navigate
- [ ] Ads display and are clickable
- [ ] No layout issues on mobile/tablet

---

## Related Features
- **Lessons:** Completion unlocks practice
- **Wallet:** Virtual balance for trading (future)
- **Profile:** Achievements for successful trades (future)

---

## References
- [PROGRESS.md](../../PROGRESS.md) — Overall progress
- [.development-workflow.md](../../.development-workflow.md) — How to work on this
- [docs/features/LESSONS.md](LESSONS.md) — How progression works
- [docs/features/MONETIZATION.md](MONETIZATION.md) — Ad integration details

---

Last Updated: Session 4, 2025-12-29
