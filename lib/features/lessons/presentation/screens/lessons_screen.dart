import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson.dart';
import 'package:crypto_trading_lessons/features/lessons/data/lesson_repository.dart';
import 'package:crypto_trading_lessons/features/lessons/presentation/widgets/lesson_tile.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  final Map<LessonCategory, bool> expandedState = {
    LessonCategory.beginner: true,
    LessonCategory.intermediate: false,
    LessonCategory.advanced: false,
  };

  @override
  Widget build(BuildContext context) {
    // Получаем все уроки из репозитория
    final allLessons = LessonRepository.getAllLessons();
    final currentLessonId = LessonRepository.getCurrentLessonId();

    final beginnerLessons = allLessons
        .where((l) => l.category == LessonCategory.beginner)
        .toList();
    final intermediateLessons = allLessons
        .where((l) => l.category == LessonCategory.intermediate)
        .toList();
    final advancedLessons = allLessons
        .where((l) => l.category == LessonCategory.advanced)
        .toList();

    final totalCompleted = allLessons.where((l) => l.isCompleted).length;
    final totalLessons = allLessons.length;
    final progressPercent = (totalCompleted / totalLessons) * 100;
    final userLevel = _calculateLevel(totalCompleted);
    final levelName = _getLevelName(userLevel);

    return Scaffold(
      appBar: AppBar(title: const Text('Lessons'), elevation: 0),
      body: CustomScrollView(
        slivers: [
          // Progress section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Progress',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            levelName,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                  fontSize: 18,
                                ),
                          ),
                          Text(
                            '$totalCompleted/$totalLessons lessons',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppConstants.radiusSmall,
                    ),
                    child: LinearProgressIndicator(
                      value: totalCompleted / totalLessons,
                      minHeight: 10,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${progressPercent.toStringAsFixed(0)}% complete',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),

          // Lesson categories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingLarge,
                vertical: AppConstants.paddingMedium,
              ),
              child: _buildCategorySection(
                context,
                category: LessonCategory.beginner,
                lessons: beginnerLessons,
                isLocked: false,
                currentLessonId: currentLessonId,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingLarge,
                vertical: AppConstants.paddingMedium,
              ),
              child: _buildCategorySection(
                context,
                category: LessonCategory.intermediate,
                lessons: intermediateLessons,
                isLocked: totalCompleted < 5,
                currentLessonId: currentLessonId,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingLarge,
                vertical: AppConstants.paddingMedium,
              ),
              child: _buildCategorySection(
                context,
                category: LessonCategory.advanced,
                lessons: advancedLessons,
                isLocked: totalCompleted < 8,
                currentLessonId: currentLessonId,
              ),
            ),
          ),

          // Bottom padding
          SliverToBoxAdapter(
            child: SizedBox(height: AppConstants.paddingLarge),
          ),
        ],
      ),
    );
  }

  int _calculateLevel(int lessonsCompleted) {
    // Level progression: Newbie (0), Trader (3), Advanced (6), Master (9)
    if (lessonsCompleted >= 8) return 4;
    if (lessonsCompleted >= 6) return 3;
    if (lessonsCompleted >= 3) return 2;
    if (lessonsCompleted >= 1) return 1;
    return 0;
  }

  String _getLevelName(int level) {
    const levelNames = [
      '📱 Newbie',
      '📈 Trader',
      '🚀 Advanced',
      '👑 Master',
      '⭐ Legend',
    ];
    return levelNames[level];
  }

  Widget _buildCategorySection(
    BuildContext context, {
    required LessonCategory category,
    required List<Lesson> lessons,
    required bool isLocked,
    required int currentLessonId,
  }) {
    final isExpanded = expandedState[category] ?? false;
    final categoryTitle = Lesson.getCategoryTitle(category);

    return Column(
      children: [
        GestureDetector(
          onTap: isLocked
              ? null
              : () {
                  setState(() {
                    expandedState[category] = !isExpanded;
                  });
                },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
              vertical: AppConstants.paddingMedium,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(isLocked ? 0.05 : 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                if (isLocked)
                  const Padding(
                    padding: EdgeInsets.only(right: AppConstants.paddingSmall),
                    child: Icon(Icons.lock, size: 18, color: AppColors.primary),
                  )
                else
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.primary,
                  ),
                const SizedBox(width: AppConstants.paddingMedium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoryTitle,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                      ),
                      if (isLocked)
                        Text(
                          'Complete 5 beginner lessons to unlock',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppColors.warning,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                    ],
                  ),
                ),
                if (!isLocked)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingSmall,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        AppConstants.radiusSmall,
                      ),
                    ),
                    child: Text(
                      '${lessons.length}',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (isExpanded && !isLocked)
          Padding(
            padding: const EdgeInsets.only(top: AppConstants.paddingMedium),
            child: Column(
              children: lessons
                  .map(
                    (lesson) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppConstants.paddingSmall,
                      ),
                      child: LessonTile(
                        lesson: lesson,
                        currentLessonId: currentLessonId,
                        onTap: () {
                          context.go('/lessons/${lesson.id}');
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}
