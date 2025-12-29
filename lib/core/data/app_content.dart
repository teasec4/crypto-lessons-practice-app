/// Central hub for all app content (lessons, pages, tips, etc.)
/// This file aggregates content from individual files for easy access
/// 
/// Future phases:
/// - Phase 2: Replace with API calls
/// - Phase 3: Replace with Drift database queries
/// - Phase 4: Replace with real-time API updates

library app_content;

import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson.dart';
import 'content/lessons_content.dart';

class AppContent {
  /// Get all lessons with full content
  static List<Lesson> getAllLessons() {
    return LessonsContent.lessons;
  }

  /// Get lesson by ID with full content
  static Lesson? getLessonById(int id) {
    try {
      return LessonsContent.lessons.firstWhere((l) => l.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get current/next lesson ID for user progression
  static int getCurrentLessonId() {
    return LessonsContent.currentLessonId;
  }

  /// Get lessons by category
  static List<Lesson> getLessonsByCategory(LessonCategory category) {
    return LessonsContent.lessons
        .where((l) => l.category == category)
        .toList();
  }

  // Future content types can be added here:
  // - static List<Quiz> getAllQuizzes() { }
  // - static List<TradingTip> getTradingTips() { }
  // - static List<Article> getArticles() { }
  // - static List<Achievement> getAllAchievements() { }
  // etc.
}
