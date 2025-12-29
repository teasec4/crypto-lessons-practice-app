enum LessonCategory {
  beginner,
  intermediate,
  advanced,
}

class Lesson {
  final int id;
  final String title;
  final String description;
  final int duration; // в минутах
  final int difficulty; // 1-5
  final bool isCompleted;
  final LessonCategory category;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.difficulty,
    required this.category,
    this.isCompleted = false,
  });

  static String getCategoryTitle(LessonCategory category) {
    switch (category) {
      case LessonCategory.beginner:
        return 'Beginner';
      case LessonCategory.intermediate:
        return 'Intermediate';
      case LessonCategory.advanced:
        return 'Advanced';
    }
  }

  String getDifficultyLabel() {
    if (difficulty <= 2) {
      return 'Easy';
    } else if (difficulty == 3) {
      return 'Medium';
    } else {
      return 'Hard';
    }
  }
}
