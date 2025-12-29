import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson.dart';
import 'package:crypto_trading_lessons/features/lessons/presentation/widgets/lesson_tile.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final lessons = List.generate(
      10,
      (i) => Lesson(
        id: i + 1,
        title: 'Introduction to Trading',
        description:
            'Learn the basics of cryptocurrency trading and market analysis.',
        duration: 15 + (i * 5),
        difficulty: (i % 5) + 1,
        isCompleted: i < 3,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons'),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.paddingMedium,
        ),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return LessonTile(
            lesson: lessons[index],
            onTap: () {
              // TODO: Navigate to lesson detail
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Lesson ${lessons[index].id} tapped'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
