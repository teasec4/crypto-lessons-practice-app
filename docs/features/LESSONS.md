# Lessons Feature

Complete guide to the Lessons system.

## Overview

Educational lessons about cryptocurrency trading fundamentals. Users progress through 9 lessons organized by difficulty level with a progressive unlocking system.

## Core Features

### Lesson System
- **9 Total Lessons:**
  - 5 Beginner lessons (unlocked by default)
  - 2 Intermediate lessons (unlock after 5 beginner)
  - 2 Advanced lessons (unlock after 8 total)

### Difficulty Levels
- **Easy** (Green) — Beginner concepts
- **Medium** (Orange) — Intermediate strategies
- **Hard** (Red) — Advanced tactics

### Progression System
- **Current Lesson** → Bright "Start" button, full color
- **Completed Lessons** → Green checkmark, tinted
- **Locked Lessons** → Lock icon, greyed out
- **Level System** → Newbie → Trader → Advanced → Master → Legend

### Content Structure
Each lesson has:
- Title & description
- Duration in minutes
- Difficulty badge
- Content sections (3-5 per lesson)
- Completion tracking

---

## Architecture

### Entities
```dart
// lib/features/lessons/domain/entities/lesson.dart
class Lesson {
  final int id;
  final String title;
  final String description;
  final int duration;        // minutes
  final LessonCategory category;
  final Difficulty difficulty;
  final bool isCompleted;
}

enum LessonCategory { beginner, intermediate, advanced }
enum Difficulty { easy, medium, hard }
```

### Repository
```dart
// lib/features/lessons/data/lesson_repository.dart
- getAllLessons()       → List<Lesson>
- getLessonById(id)     → Lesson
- getCurrentLessonId()  → int (for progress tracking)
- (future) updateLessonStatus() → save to DB
```

### Mock Data
Located in `lesson_repository.dart`:
- Lessons 1-3: Completed
- Lesson 4: Current
- Lessons 5-9: Locked (waiting for completion)

---

## Screens

### 1. Lessons Screen (`lessons_screen.dart`)
Main hub for all lessons.

**Layout:**
- Progress section (top) — Level, completed count, progress bar
- Category sections — Expandable groups for Beginner/Intermediate/Advanced
- Locked category messaging — Why they're locked

**Features:**
- Expandable/collapsible categories
- Progress tracking (visual + percentage)
- Level system (emoji + level name)
- Lock system for categories

**State:**
```dart
Map<LessonCategory, bool> expandedState;  // Track which categories are open
```

### 2. Lesson Detail Screen (`lesson_detail_screen.dart`)
Overview of a single lesson before starting.

**Layout:**
- Hero section (gradient) — Title + difficulty badge
- Content sections — 3-5 checklist items
- Start button — Navigate to content

**Features:**
- Duration display
- Completion status badge
- Content preview
- Call-to-action button

### 3. Lesson Content Screen (`lesson_content_screen.dart`)
Interactive lesson content with pages/sections.

**Layout:**
- Page counter (e.g., "1 of 10")
- Content per page
- Navigation buttons (Previous/Next)
- Native ad on last page
- Completion dialog on finish

**Features:**
- Multi-page content viewing
- Progress within lesson
- Native ad integration (monetization)
- Completion celebration with optional quiz

---

## UI Components

### Lesson Tile Widget
```dart
// lib/features/lessons/presentation/widgets/lesson_tile.dart
LessonTile(
  lesson: lesson,
  currentLessonId: 4,
  onTap: () { /* navigate */ }
)
```

**States:**
- **Completed:** Green checkmark, full opacity, blue gradient
- **Current:** Bright blue "Start" button, double shadow
- **Locked:** Lock icon, grey button, 0.75 opacity, greyed text
- **Inactive:** Normal display, waiting state

**Visual Design:**
- Gradient backgrounds (blue for completed, grey for locked)
- Double box shadows for depth
- Responsive padding and sizing
- Icon sizing (18-20px)

---

## Navigation

### Routes
```dart
/lessons              → LessonsScreen (default start)
/lessons/:id         → LessonDetailScreen
/lessons/:id/content → LessonContentScreen
```

### Navigation Flow
1. LessonsScreen → tap lesson → LessonDetailScreen
2. LessonDetailScreen → tap "Start" → LessonContentScreen
3. LessonContentScreen → complete → Show dialog + navigate back

---

## Monetization

### Native Ads Integration

**Placement 1: Last Content Page**
- Shows before "Complete Lesson" button
- Message: "Ready to Trade?"
- Action: "Explore Trading" button
- File: lesson_content_screen.dart (line ~79)

**Placement 2: Completion Dialog**
- Shows after lesson completed
- Message: "Start Real Trading Today"
- Part of celebration moment
- Drives traffic to practice screen

**Component:** NativeAdCard (core/widgets/native_ad_card.dart)

---

## State Management (Current & Planned)

### Current (Session 4)
- Mock data in LessonRepository
- Local component state (expandedState)
- No persistence between app restarts

### Planned
- BLoC for lesson state (current, completed, locked)
- Drift database for persistence
- User-specific progress tracking
- Sync with backend API

---

## Code Patterns

### Lesson Filtering
```dart
final beginnerLessons = allLessons
    .where((l) => l.category == LessonCategory.beginner)
    .toList();
```

### Level Calculation
```dart
int level = _calculateLevel(completedCount);
// 0-0: Newbie, 1-2: Trader, 3-5: Advanced, 6-7: Master, 8+: Legend
```

### Difficulty Color
```dart
Color _getDifficultyColor(Difficulty diff) {
  return switch(diff) {
    Difficulty.easy => AppColors.success,      // Green
    Difficulty.medium => AppColors.warning,    // Orange
    Difficulty.hard => AppColors.error,        // Red
  };
}
```

---

## Key Files

### Domain (Logic)
- `lib/features/lessons/domain/entities/lesson.dart`
- `lib/features/lessons/domain/entities/lesson_page.dart`

### Data (Mock Storage)
- `lib/features/lessons/data/lesson_repository.dart`

### Presentation (UI)
- `lib/features/lessons/presentation/screens/lessons_screen.dart`
- `lib/features/lessons/presentation/screens/lesson_detail_screen.dart`
- `lib/features/lessons/presentation/screens/lesson_content_screen.dart`
- `lib/features/lessons/presentation/widgets/lesson_tile.dart`

---

## Testing

### Test Cases
- [ ] Lessons load from repository
- [ ] Categories expand/collapse
- [ ] Progress bar updates correctly
- [ ] Level name changes at thresholds
- [ ] Locked categories show lock icon
- [ ] Navigation to detail screen works
- [ ] Navigation to content screen works
- [ ] Ads show on last page
- [ ] Completion dialog shows and navigates

### Manual Testing Checklist
- [ ] Tap lesson → Detail screen opens
- [ ] Scroll content pages → Counter updates
- [ ] Last page → Ad appears
- [ ] Complete lesson → Dialog shows
- [ ] Level changes → Display updates
- [ ] Categories lock/unlock correctly

---

## Future Enhancements

### Phase 2 (BLoC + DB)
- [ ] Persist progress to database
- [ ] Sync with user account
- [ ] Real lesson content (not mock)
- [ ] Quiz at end of each section
- [ ] Time tracking (how long per lesson)
- [ ] Achievement unlock on completion

### Phase 3 (Advanced)
- [ ] Video content support
- [ ] Downloadable PDFs
- [ ] Interactive charts
- [ ] Discussion forums
- [ ] Instructor Q&A
- [ ] Certificate on completion

---

## Related Features
- **Profile:** Achievement unlocks on lesson completion
- **Practice:** Unlocks after 5 beginner lessons
- **Wallet:** Learning path leads to practice
- **Monetization:** Native ads on completion

---

Last Updated: Session 4, 2025-12-29
