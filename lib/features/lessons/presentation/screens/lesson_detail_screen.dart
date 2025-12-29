import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';
import 'package:crypto_trading_lessons/features/lessons/data/lesson_repository.dart';
import 'package:crypto_trading_lessons/core/widgets/native_ad_card.dart';

class LessonDetailScreen extends StatefulWidget {
  final int lessonId;

  const LessonDetailScreen({super.key, required this.lessonId});

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    // Получаем урок из репозитория
    final lesson = LessonRepository.getLessonById(widget.lessonId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson ${lesson.id}'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: CustomScrollView(
              slivers: [
                // Hero section
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.primary, AppColors.primaryDark],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.paddingLarge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              lesson.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppConstants.paddingMedium),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(
                                AppConstants.radiusSmall,
                              ),
                            ),
                            child: Text(
                              lesson.getDifficultyLabel(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Content
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingLarge,
                      vertical: AppConstants.paddingMedium,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Lesson info - compact
                        Row(
                          children: [
                            const Icon(Icons.timer_outlined, size: 18),
                            const SizedBox(width: 6),
                            Text(
                              '${lesson.duration} min',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: AppConstants.paddingLarge),
                            if (lesson.isCompleted)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.success.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                    AppConstants.radiusSmall,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check,
                                      size: 12,
                                      color: AppColors.success,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      'Completed',
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppColors.success,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: AppConstants.paddingMedium),

                        // Description - compact
                        Text(
                          lesson.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: AppConstants.paddingMedium),

                        // Content sections - minimal
                        ..._buildContentSections(context),

                        const SizedBox(height: AppConstants.paddingSmall),

                        // Start button - smaller
                        SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.primary.withOpacity(0.8),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                AppConstants.radiusMedium,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  context.go('/lessons/${lesson.id}/content');
                                },
                                borderRadius: BorderRadius.circular(
                                  AppConstants.radiusMedium,
                                ),
                                child: Center(
                                  child: Text(
                                    lesson.isCompleted ? 'Review' : 'Start Lesson',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Fixed ad footer
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingLarge,
              vertical: AppConstants.paddingSmall,
            ),
            child: NativeAdCard(
              title: 'Boost Your Learning',
              description: 'Get access to premium study materials and trading tools.',
              buttonText: 'Explore',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Premium features coming soon'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContentSections(BuildContext context) {
    final sections = [
      'Cryptocurrency Basics',
      'Market Analysis',
      'Risk Management',
    ];

    return sections
        .map(
          (section) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary.withOpacity(0.15)),
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              ),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withOpacity(0.08),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        size: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      section,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
