/// Lessons content database
/// Currently: Mock data (simple strings)
/// Future: Can be loaded from JSON files, API, or database
/// 
/// Structure is designed to be expandable:
/// - Easy to add more lessons
/// - Easy to add quiz questions
/// - Easy to add lesson prerequisites
/// - Easy to add estimated time
/// - Easy to add video links, resources, etc.

// ignore: unused_import
/// This file defines all lesson content
library lessons_content;

import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson.dart';

class LessonsContent {
  /// Current lesson ID for user progression
  /// Update this as user progresses
  /// Mock: lessons 1-3 completed, 4 in progress
  static const int currentLessonId = 4;

  /// All lessons with full content
  static const List<Lesson> lessons = [
    // ========== BEGINNER LESSONS ==========

    Lesson(
      id: 1,
      title: 'Bitcoin Basics',
      description: 'Learn the fundamentals of Bitcoin and blockchain technology.',
      duration: 15,
      category: LessonCategory.beginner,
      difficulty: 1, // Easy
      isCompleted: true,
    ),

    Lesson(
      id: 2,
      title: 'Crypto Wallets',
      description: 'Understand how to store and manage your cryptocurrencies safely.',
      duration: 12,
      category: LessonCategory.beginner,
      difficulty: 1, // Easy
      isCompleted: true,
    ),

    Lesson(
      id: 3,
      title: 'First Trade',
      description: 'Make your first cryptocurrency trade step by step.',
      duration: 20,
      category: LessonCategory.beginner,
      difficulty: 1, // Easy
      isCompleted: true,
    ),

    Lesson(
      id: 4,
      title: 'Risk Management',
      description: 'Learn to manage trading risks and protect your portfolio.',
      duration: 18,
      category: LessonCategory.beginner,
      difficulty: 2, // Medium
      isCompleted: false,
    ),

    Lesson(
      id: 5,
      title: 'Market Analysis',
      description: 'Analyze cryptocurrency market trends and patterns.',
      duration: 25,
      category: LessonCategory.beginner,
      difficulty: 2, // Medium
      isCompleted: false,
    ),

    // ========== INTERMEDIATE LESSONS ==========

    Lesson(
      id: 6,
      title: 'Trading Strategies',
      description: 'Learn profitable trading strategies for different market conditions.',
      duration: 30,
      category: LessonCategory.intermediate,
      difficulty: 2, // Medium
      isCompleted: false,
    ),

    Lesson(
      id: 7,
      title: 'Technical Indicators',
      description: 'Master technical analysis tools and indicators.',
      duration: 28,
      category: LessonCategory.intermediate,
      difficulty: 3, // Hard
      isCompleted: false,
    ),

    // ========== ADVANCED LESSONS ==========

    Lesson(
      id: 8,
      title: 'Advanced Charts',
      description: 'Advanced charting techniques and pattern recognition.',
      duration: 35,
      category: LessonCategory.advanced,
      difficulty: 3, // Hard
      isCompleted: false,
    ),

    Lesson(
      id: 9,
      title: 'Portfolio Management',
      description: 'Manage a diversified crypto portfolio effectively.',
      duration: 32,
      category: LessonCategory.advanced,
      difficulty: 4, // Very Hard
      isCompleted: false,
    ),
  ];

  // ========== LESSON PAGES/CONTENT ==========
  // Currently stored inline in lesson_content_screen.dart
  // Future: Move to separate lessonPages map:
  //
  // static const Map<int, List<LessonPage>> lessonPages = {
  //   1: [
  //     LessonPage(
  //       pageNumber: 1,
  //       title: 'What is Bitcoin?',
  //       content: 'Bitcoin is a decentralized digital currency...',
  //       sections: ['What is Blockchain?', 'How Bitcoin Works', 'Key Concepts'],
  //     ),
  //     LessonPage(...),
  //   ],
  //   2: [...],
  //   ...
  // };

  // ========== QUIZ DATA ==========
  // Future: Add quiz questions for each lesson:
  //
  // static const Map<int, List<QuizQuestion>> lessonQuizzes = {
  //   1: [
  //     QuizQuestion(
  //       question: 'What year was Bitcoin created?',
  //       options: ['2009', '2010', '2011', '2012'],
  //       correctAnswer: 0,
  //     ),
  //     ...
  //   ],
  //   ...
  // };

  // ========== RESOURCES ==========
  // Future: Add additional resources for each lesson:
  //
  // static const Map<int, List<Resource>> lessonResources = {
  //   1: [
  //     Resource(
  //       title: 'Bitcoin Whitepaper',
  //       url: 'https://bitcoin.org/bitcoin.pdf',
  //       type: ResourceType.pdf,
  //     ),
  //     ...
  //   ],
  //   ...
  // };
}
