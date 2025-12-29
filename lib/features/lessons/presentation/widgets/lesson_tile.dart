// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';
import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson.dart';

class LessonTile extends StatelessWidget {
  final Lesson lesson;
  final VoidCallback? onTap;
  final int currentLessonId;

  const LessonTile({
    super.key,
    required this.lesson,
    this.onTap,
    required this.currentLessonId,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = lesson.isCompleted;
    final titleColor = isCompleted ? Colors.black87 : Colors.grey[600];
    final borderColor = isCompleted
        ? AppColors.primary.withOpacity(0.15)
        : Colors.grey.withOpacity(0.15);
    final gradientStart = isCompleted
        ? AppColors.primary.withOpacity(0.05)
        : Colors.grey.withOpacity(0.03);
    final gradientEnd = isCompleted
        ? AppColors.primary.withOpacity(0.02)
        : Colors.grey.withOpacity(0.01);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          gradient: LinearGradient(colors: [gradientStart, gradientEnd]),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: isCompleted
                  ? AppColors.primary.withOpacity(0.08)
                  : Colors.grey.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            splashColor: AppColors.primary.withOpacity(0.1),
            highlightColor: AppColors.primary.withOpacity(0.05),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
                vertical: AppConstants.paddingMedium,
              ),
              child: Row(
                children: [
                  // Lesson number with gradient
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: isCompleted
                            ? [
                                AppColors.primary,
                                AppColors.primary.withOpacity(0.7),
                              ]
                            : [Colors.grey[400]!, Colors.grey[500]!],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isCompleted
                              ? AppColors.primary.withOpacity(0.3)
                              : Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${lesson.id}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingMedium),

                  // Title and duration
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          lesson.title,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: titleColor,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 14,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${lesson.duration}m',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Difficulty badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isCompleted
                          ? _getDifficultyColor(lesson.difficulty)
                          : _getDifficultyColor(
                              lesson.difficulty,
                            ).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(
                        AppConstants.radiusSmall,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isCompleted
                              ? _getDifficultyColor(
                                  lesson.difficulty,
                                ).withOpacity(0.3)
                              : Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Text(
                      lesson.getDifficultyLabel(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  // Completion status or start button
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppConstants.paddingSmall,
                    ),
                    child: isCompleted
                        ? AnimatedScale(
                            scale: 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              Icons.check_circle,
                              size: 24,
                              color: AppColors.success,
                            ),
                          )
                        : _buildActionButton(
                            isCurrentLesson: lesson.id == currentLessonId,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({required bool isCurrentLesson}) {
    if (isCurrentLesson) {
      // Current lesson - яркая и видная кнопка Start
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primary.withOpacity(0.75)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.5),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
            BoxShadow(
              color: AppColors.primary.withOpacity(0.25),
              blurRadius: 24,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Text(
          'Start',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.8,
          ),
        ),
      );
    } else {
      // Future lesson - серая кнопка Locked
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lock, size: 12, color: Colors.white),
            const SizedBox(width: 4),
            const Text(
              'Locked',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    }
  }

  Color _getDifficultyColor(int difficulty) {
    switch (difficulty) {
      case 1:
      case 2:
        return AppColors.success;
      case 3:
        return AppColors.warning;
      case 4:
      case 5:
        return AppColors.error;
      default:
        return AppColors.info;
    }
  }
}
