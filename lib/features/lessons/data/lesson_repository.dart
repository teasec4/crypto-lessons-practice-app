import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson.dart';

class LessonRepository {
  static final List<Map<String, dynamic>> _lessonsData = [
    // Beginner lessons
    {
      'id': 1,
      'title': 'Crypto Basics',
      'description': 'Learn the fundamentals of cryptocurrency.',
      'duration': 15,
      'difficulty': 1,
      'category': LessonCategory.beginner,
    },
    {
      'id': 2,
      'title': 'Blockchain Explained',
      'description': 'Understanding blockchain technology.',
      'duration': 20,
      'difficulty': 2,
      'category': LessonCategory.beginner,
    },
    {
      'id': 3,
      'title': 'Wallets & Security',
      'description': 'Secure your cryptocurrency assets.',
      'duration': 18,
      'difficulty': 2,
      'category': LessonCategory.beginner,
    },
    {
      'id': 4,
      'title': 'First Trade',
      'description': 'Make your first cryptocurrency trade.',
      'duration': 25,
      'difficulty': 2,
      'category': LessonCategory.beginner,
    },
    {
      'id': 5,
      'title': 'Risk Management',
      'description': 'Learn to manage trading risks.',
      'duration': 20,
      'difficulty': 3,
      'category': LessonCategory.beginner,
    },
    // Intermediate lessons
    {
      'id': 6,
      'title': 'Technical Analysis',
      'description': 'Master chart analysis and indicators.',
      'duration': 30,
      'difficulty': 3,
      'category': LessonCategory.intermediate,
    },
    {
      'id': 7,
      'title': 'Trading Strategies',
      'description': 'Learn profitable trading strategies.',
      'duration': 35,
      'difficulty': 3,
      'category': LessonCategory.intermediate,
    },
    // Advanced lessons
    {
      'id': 8,
      'title': 'Advanced Charts',
      'description': 'Complex analysis techniques.',
      'duration': 40,
      'difficulty': 4,
      'category': LessonCategory.advanced,
    },
    {
      'id': 9,
      'title': 'Automated Trading',
      'description': 'Bot trading and automation.',
      'duration': 45,
      'difficulty': 5,
      'category': LessonCategory.advanced,
    },
  ];

  static Lesson getLessonById(int id) {
    final data = _lessonsData.firstWhere(
      (lesson) => lesson['id'] == id,
      orElse: () => _lessonsData[0],
    );

    return Lesson(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      duration: data['duration'],
      difficulty: data['difficulty'],
      category: data['category'],
      isCompleted: id < 4, // Mock - первые 3 урока завершены
    );
  }

  static List<Lesson> getAllLessons() {
    return _lessonsData.map((data) {
      return Lesson(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        duration: data['duration'],
        difficulty: data['difficulty'],
        category: data['category'],
        isCompleted: data['id'] < 4,
      );
    }).toList();
  }

  /// Получить ID текущего (следующего для прохождения) урока
  static int getCurrentLessonId() {
    // Mock: первые 3 урока завершены (isCompleted при id < 4)
    // значит текущий урок это 4й
    return 4;
  }
}
