# Profile Feature

User profile, achievements, and settings management.

## Overview

User profile displays progress metrics, achievements, and settings. Acts as a central hub for personalization and account management.

## Current Features

### Profile Data
- **User Name:** "Alex Trader"
- **Email:** alex.trader@crypto.com
- **Level:** 3 (Advanced Trader)
- **Experience Points (EXP):** 2,450
- **Lessons Completed:** 7/9
- **Join Date:** 45 days ago (mock)

### Achievements System
6 total achievements with mixed unlock states:

| # | Title | Description | Icon | Status |
|---|-------|-------------|------|--------|
| 1 | First Step | Complete first lesson | 🚀 | ✅ Unlocked |
| 2 | Quick Learner | Complete 5 lessons | 📚 | ✅ Unlocked |
| 3 | Trading Master | Complete 10 lessons | 🏆 | 🔒 Locked |
| 4 | Millionaire | Reach $1M balance | 💰 | 🔒 Locked |
| 5 | Streak Master | 7 day streak | 🔥 | ✅ Unlocked |
| 6 | Perfect Score | Score 100% on 3 lessons | ⭐ | 🔒 Locked |

### Settings Sections

**Preferences:**
- Notifications (toggle)
- Preferred Currency (USD)

**Security:**
- Change Password
- Two-Factor Authentication

**General:**
- About
- Logout

---

## Architecture

### Entities
```dart
// lib/features/profile/domain/entities/user.dart
class User {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final int lessonsCompleted;
  final int totalExp;
  final int level;
  final DateTime joinDate;
}

// lib/features/profile/domain/entities/achievement.dart
class Achievement {
  final String id;
  final String title;
  final String description;
  final String icon;       // Emoji
  final bool unlocked;
  final DateTime? unlockedAt;
}
```

### Repository
```dart
// Future: lib/features/profile/data/profile_repository.dart
// Currently: Mock data in presentation
```

---

## Screens

### Profile Screen (`profile_screen.dart`)
User profile and settings hub.

**Layout (CustomScrollView):**
1. **Profile Header** (top)
   - Gradient background card
   - Avatar placeholder
   - Name & email
   - Stats: Level, EXP, lessons completed
   - Progress bar to next level

2. **Achievements Section** (middle)
   - "Achievements" title
   - Grid of 6 achievement items
   - Unlocked show full color
   - Locked show greyed out

3. **Settings Sections** (bottom)
   - Preferences (Notifications, Currency)
   - Security (Password, 2FA)
   - General (About, Logout)

**State:**
```dart
bool notificationsEnabled = true;
bool darkModeEnabled = false;
```

---

## UI Components

### Profile Header Widget
```dart
// lib/features/profile/presentation/widgets/profile_header.dart
class ProfileHeader extends StatelessWidget {
  - Gradient card background
  - User info display
  - Stats display
  - Progress bar to next level
}
```

**Visual Design:**
- Blue-purple gradient
- White text
- Shadow for depth
- Responsive layout

### Achievement Item Widget
```dart
// lib/features/profile/presentation/widgets/achievement_item.dart
class AchievementItem extends StatelessWidget {
  - Icon (emoji)
  - Title & description
  - Unlocked status badge
  - Tap feedback
}
```

**States:**
- **Unlocked:** Full color, no lock
- **Locked:** Greyed out (0.5 opacity), lock icon visible

### Settings Section Widget
```dart
// lib/features/profile/presentation/widgets/settings_section.dart
class SettingsSection extends StatelessWidget {
  - Section title
  - List of setting tiles
  - Visual grouping with dividers
}

class SettingsTile extends StatelessWidget {
  - Icon on left
  - Title & subtitle
  - Trailing widget (switch, arrow, etc.)
  - On tap callback
}
```

---

## Navigation

### Routes
```dart
/profile → ProfileScreen (tab 4)
```

### Navigation Flow
- **From bottom nav:** Tap profile tab
- **From settings:** Taps show snackbar (placeholder)
- **Future:** Settings might navigate to detail screens

---

## Monetization

### Native Ads Integration (Session 4)
**Placement:** Between achievements and settings

```
[Profile Header]
    ↓
[Achievements Grid]
    ↓
[Native Ad Card] ← "Boost Your Trading" offer
    ↓
[Settings Sections]
```

**Ad Content:**
- Title: "Boost Your Trading"
- Description: "Upgrade to Pro and unlock advanced strategies with real-time analytics."
- Button: "Explore Premium"
- Position: After achievements, before settings

**Purpose:** 
- Encourage premium upgrade for power users
- Natural engagement point
- Non-intrusive placement

---

## State Management

### Current (Session 4)
```dart
class _ProfileScreenState extends State<ProfileScreen> {
  // Local state for settings
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  
  // Mock user data in build method
  final mockUser = User(
    id: '1',
    name: 'Alex Trader',
    lessonsCompleted: 7,
    totalExp: 2450,
    level: 3,
  );
  
  // Mock achievements
  final mockAchievements = [/* 6 items */];
}
```

**Issues:**
- Data in presentation layer
- Local state not persisted
- No real user sync

### Planned (Phase 2)
```dart
// With BLoC/Provider
final userBloc = context.read<UserBloc>();
final user = userBloc.state.user;

// Achievements loaded from database
final achievements = context.read<AchievementBloc>().state.achievements;

// Settings synced with preferences
final notificationsEnabled = context.read<SettingsBloc>().state.notifications;
```

**Benefits:**
- Persistent settings
- Synced across app
- Real user data
- Achievement progression

---

## Level System

### EXP Progression
- **Level 0:** 0 - 500 EXP (Newbie)
- **Level 1:** 500 - 1,000 EXP (Trader)
- **Level 2:** 1,000 - 1,800 EXP (Advanced)
- **Level 3:** 1,800 - 2,800 EXP (Master)
- **Level 4:** 2,800+ EXP (Legend)

### EXP Gains (Planned)
- Complete lesson: +100 EXP
- Perfect score on lesson: +50 bonus EXP
- Win practice trade: +50 EXP
- Unlock achievement: +25 EXP

---

## Future Implementation

### Phase 2: Real User Data
1. **User Account**
   - Create/login
   - Save preferences
   - Sync across devices

2. **Achievement Unlocking**
   - Trigger from lesson completion
   - Trigger from practice wins
   - Unlock notifications

3. **Settings Management**
   - Persist to database
   - Apply immediately
   - Sync with app behavior

### Phase 3: Advanced Features
- User avatars (upload)
- User statistics (detailed)
- Trading leaderboard
- Social profiles (share achievements)
- Account recovery

### Phase 4: Gamification
- Custom badges
- User titles
- Streak tracking
- Seasonal achievements
- Special events

---

## Key Files

### Screen
- `lib/features/profile/presentation/screens/profile_screen.dart`

### Widgets
- `lib/features/profile/presentation/widgets/profile_header.dart`
- `lib/features/profile/presentation/widgets/achievement_item.dart`
- `lib/features/profile/presentation/widgets/settings_section.dart`
- `lib/core/widgets/native_ad_card.dart` (shared)

### Entities
- `lib/features/profile/domain/entities/user.dart`
- `lib/features/profile/domain/entities/achievement.dart`

### Future
- `lib/features/profile/data/profile_repository.dart` (Phase 2)
- `lib/features/profile/data/settings_repository.dart` (Phase 2)

---

## Code Patterns

### Achievement Display
```dart
mockAchievements.map((achievement) => 
  AchievementItem(
    achievement: achievement,
    onTap: achievement.unlocked ? () => _showDetails() : null,
  )
).toList()
```

### Settings Tile
```dart
SettingsTile(
  title: 'Notifications',
  subtitle: notificationsEnabled ? 'Enabled' : 'Disabled',
  icon: Icons.notifications,
  trailing: Switch(
    value: notificationsEnabled,
    onChanged: (value) => setState(() { notificationsEnabled = value; }),
  ),
)
```

### Level from EXP
```dart
int _getLevelFromExp(int exp) {
  if (exp >= 2800) return 4;
  if (exp >= 1800) return 3;
  if (exp >= 1000) return 2;
  if (exp >= 500) return 1;
  return 0;
}
```

---

## Testing

### Test Cases
- [ ] Profile header displays correct user info
- [ ] All 6 achievements display
- [ ] Unlocked achievements show full color
- [ ] Locked achievements show greyed out
- [ ] Notifications toggle works
- [ ] Settings taps show snackbar
- [ ] Native ad displays between sections
- [ ] No layout issues on mobile/tablet

### Manual Testing Checklist
- [ ] User name and email visible
- [ ] Level and EXP display
- [ ] Progress bar shows correctly
- [ ] Achievement icons display
- [ ] Unlocked/locked visual distinction clear
- [ ] Settings section expandable
- [ ] All buttons clickable
- [ ] Responsive on different screen sizes

---

## Related Features
- **Lessons:** EXP gains on completion
- **Practice:** EXP gains on successful trades
- **Wallet:** Balance used for achievements
- **Monetization:** Premium features in profile

---

## References
- [PROGRESS.md](../../PROGRESS.md) — Overall progress
- [.development-workflow.md](../../.development-workflow.md) — How to work on this
- [docs/features/LESSONS.md](LESSONS.md) — How EXP integrates
- [docs/features/MONETIZATION.md](MONETIZATION.md) — Ad placement
- [docs/UI_COMPONENTS.md](../UI_COMPONENTS.md) — Design system

---

Last Updated: Session 4, 2025-12-29
