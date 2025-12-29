# Content Structure Guide

How app content is organized and stored. Designed to be simple now and scalable for the future.

## Current Architecture

### Central Hub: `AppContent`
**Location:** `lib/core/data/app_content.dart`

Single class that aggregates all app content. Acts as a facade/gateway:
- Simple to use: `AppContent.getAllLessons()`
- Easy to switch data sources later
- Type-safe and searchable
- Future-proof

```dart
// Usage in any screen:
final lessons = AppContent.getAllLessons();
final lesson = AppContent.getLessonById(1);
final current = AppContent.getCurrentLessonId();
```

### Content Files: `lib/core/data/content/`
**Location:** `lib/core/data/content/`

Individual files for each content type:

1. **`lessons_content.dart`** — All lesson definitions
   - 9 lessons with metadata
   - Difficulty levels
   - Completion status
   - Category grouping
   - Current lesson ID

Future files:
- `quiz_content.dart` — Quiz questions
- `tips_content.dart` — Trading tips
- `achievements_content.dart` — Achievement definitions
- `resources_content.dart` — External resources

### Repository Layer: `LessonRepository`
**Location:** `lib/features/lessons/data/lesson_repository.dart`

Still exists but now delegates to `AppContent`:
- Maintains existing API (no breaking changes)
- Wraps AppContent calls
- Adds feature-specific logic (lesson pages, content generation)
- Migration path to Phase 2

```dart
// Repository delegates to AppContent:
static List<Lesson> getAllLessons() {
  return AppContent.getAllLessons();  // Centralized
}

// Repository adds feature logic:
static List<LessonPage> getLessonPages(int lessonId) {
  // Generates lesson pages (future: from AppContent)
}
```

---

## File Organization

```
lib/
├── core/
│   ├── data/
│   │   ├── app_content.dart          ⭐ Central hub
│   │   └── content/                  ⭐ Content files
│   │       ├── lessons_content.dart
│   │       ├── quiz_content.dart     (future)
│   │       ├── tips_content.dart     (future)
│   │       └── achievements_content.dart (future)
│   │
│   └── [other core files...]
│
├── features/
│   └── lessons/
│       ├── domain/
│       │   └── entities/
│       │       └── lesson.dart
│       ├── data/
│       │   └── lesson_repository.dart  (delegates to AppContent)
│       └── presentation/
│           └── screens/
│               └── lessons_screen.dart (uses LessonRepository)
│
└── [other features...]
```

---

## Current Content Status

### Lessons (Complete)
✅ All 9 lessons defined in `lessons_content.dart`
✅ Metadata (title, description, duration, difficulty)
✅ Categories (Beginner/Intermediate/Advanced)
✅ Completion status (mock)
✅ Current lesson ID tracking

**Structure:**
```dart
const List<Lesson> lessons = [
  Lesson(
    id: 1,
    title: 'Bitcoin Basics',
    description: '...',
    duration: 15,
    category: LessonCategory.beginner,
    difficulty: Difficulty.easy,
    isCompleted: true,
  ),
  // ... 8 more lessons
];
```

### Lesson Pages (Partially Implemented)
✅ Page titles stored in `LessonRepository`
✅ Content generation (mock text)
⏳ Future: Move to `app_content.dart`

**Current in `LessonRepository.getLessonPages()`:**
```dart
final pagesContent = {
  1: [
    'Introduction to Cryptocurrency',
    'What is Bitcoin?',
    // ... 8 more pages
  ],
  2: [...],
  // ... 9 lessons total
};
```

### Quizzes (Not Implemented)
🔲 Future: Create `quiz_content.dart`
🔲 Will store questions and answers
🔲 One quiz per lesson (10 questions)

**Planned structure:**
```dart
static const Map<int, List<QuizQuestion>> lessonQuizzes = {
  1: [
    QuizQuestion(
      question: 'What year was Bitcoin created?',
      options: ['2009', '2010', '2011', '2012'],
      correctAnswer: 0,
    ),
    // ... more questions
  ],
  // ... lessons 2-9
};
```

### Resources (Not Implemented)
🔲 Future: Create `resources_content.dart`
🔲 Links to PDFs, articles, videos
🔲 One or more per lesson

**Planned structure:**
```dart
static const Map<int, List<Resource>> lessonResources = {
  1: [
    Resource(
      title: 'Bitcoin Whitepaper',
      url: 'https://bitcoin.org/bitcoin.pdf',
      type: ResourceType.pdf,
    ),
    // ... more resources
  ],
  // ... lessons 2-9
};
```

---

## How to Use

### As a Developer/AI

**To get lesson data:**
```dart
// Always use AppContent as source of truth
final lessons = AppContent.getAllLessons();
final lesson = AppContent.getLessonById(1);
final current = AppContent.getCurrentLessonId();
```

**To filter lessons:**
```dart
final beginner = AppContent.getLessonsByCategory(LessonCategory.beginner);
```

**In screens/widgets:**
```dart
// Use LessonRepository (which delegates to AppContent)
class LessonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lessons = LessonRepository.getAllLessons();
    // ... render lessons
  }
}
```

### To Add New Content

**To add a lesson:**
1. Open `lib/core/data/content/lessons_content.dart`
2. Add new `Lesson` entry to list
3. Update `currentLessonId` if needed
4. Add pages to `LessonRepository.getLessonPages()` map

**To add quiz questions:**
1. Create `lib/core/data/content/quiz_content.dart`
2. Copy structure from lessons_content.dart
3. Add to `AppContent` in `app_content.dart`
4. Use in lesson content screens

**To add resources:**
1. Create `lib/core/data/content/resources_content.dart`
2. Define resource entities
3. Add map of resources by lesson ID
4. Add to `AppContent`
5. Display in lesson screens

---

## Migration Path (Future Phases)

### Phase 1 (Current)
- ✅ Data in Dart constants (lessons_content.dart)
- ✅ AppContent as central hub
- ✅ No database needed

### Phase 2 (BLoC + Database)
- Move data to Drift SQLite
- AppContent queries database instead of constants
- Replace `const List<Lesson>` with database queries
- Add user-specific progress tracking

```dart
// Phase 2 example:
class AppContent {
  static Future<List<Lesson>> getAllLessons() async {
    final db = LessonDatabase();
    return db.getAllLessons();  // From database
  }
}
```

### Phase 3 (API Integration)
- Replace Drift with real backend API
- AppContent makes HTTP calls
- Real user data from server
- Sync between devices

```dart
// Phase 3 example:
class AppContent {
  static Future<List<Lesson>> getAllLessons() async {
    final api = CryptoApi();
    return api.fetchLessons();  // From API
  }
}
```

### Phase 4 (Real-Time)
- WebSocket for live updates
- Real-time progress syncing
- Collaborative learning features
- Advanced personalization

---

## Benefits of This Structure

### For Development
✅ **Simple** — All content in one place  
✅ **Centralized** — Easy to update  
✅ **Searchable** — Find content quickly  
✅ **Type-safe** — Dart constants prevent errors  
✅ **No boilerplate** — Minimal setup required  

### For Scaling
✅ **Easy migration** — Switch data source without changing code  
✅ **Flexible** — Add new content types easily  
✅ **Maintainable** — Clear structure  
✅ **Testable** — Mock data for testing  
✅ **Version-safe** — Easy to add versioning  

### For Users
✅ **Fast loading** — All data local initially  
✅ **Offline support** — Works without internet  
✅ **Consistent** — Single source of truth  
✅ **Reliable** — No API errors  

---

## Example: Adding Quiz Content

### Step 1: Create quiz_content.dart
```dart
// lib/core/data/content/quiz_content.dart
import 'package:crypto_trading_lessons/features/lessons/domain/entities/quiz.dart';

class QuizContent {
  static const Map<int, List<QuizQuestion>> lessonQuizzes = {
    1: [
      QuizQuestion(
        question: 'What year was Bitcoin created?',
        options: ['2009', '2010', '2011', '2012'],
        correctAnswer: 0,
      ),
      // ... more questions
    ],
    // ... lessons 2-9
  };

  static List<QuizQuestion>? getQuizForLesson(int lessonId) {
    return lessonQuizzes[lessonId];
  }
}
```

### Step 2: Add to AppContent
```dart
// lib/core/data/app_content.dart
import 'content/quiz_content.dart';

class AppContent {
  // ... existing methods ...
  
  static List<QuizQuestion>? getQuizForLesson(int lessonId) {
    return QuizContent.getQuizForLesson(lessonId);
  }
}
```

### Step 3: Use in screens
```dart
// In any screen:
final quiz = AppContent.getQuizForLesson(lessonId);
if (quiz != null) {
  // Show quiz
}
```

---

## Summary

| Aspect | Solution |
|--------|----------|
| Where is content? | `lib/core/data/content/` |
| How to access? | `AppContent` class methods |
| What format? | Dart constants (simple, type-safe) |
| How to add? | Create new file, add to AppContent |
| How to migrate? | AppContent delegates to new source |
| Why this way? | Simple now, scalable later |

---

Last Updated: Session 4, 2025-12-29
