import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_trading_lessons/features/lessons/data/lesson_repository.dart';
import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson_page.dart';
import 'package:crypto_trading_lessons/core/widgets/native_ad_card.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';

class LessonContentScreen extends StatefulWidget {
  final int lessonId;

  const LessonContentScreen({super.key, required this.lessonId});

  @override
  State<LessonContentScreen> createState() => _LessonContentScreenState();
}

class _LessonContentScreenState extends State<LessonContentScreen> {
  late int currentPageIndex = 0;
  late List<LessonPage> pages;

  @override
  void initState() {
    super.initState();
    pages = LessonRepository.getLessonPages(widget.lessonId);
  }

  void _goToNextPage() {
    if (currentPageIndex < pages.length - 1) {
      setState(() {
        currentPageIndex++;
      });
    } else {
      // Последняя страница - завершить урок
      _completeLesson();
    }
  }

  void _goToPreviousPage() {
    if (currentPageIndex > 0) {
      setState(() {
        currentPageIndex--;
      });
    }
  }

  void _completeLesson() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: AppColors.success,
                  size: 60,
                ),
                const SizedBox(height: AppConstants.paddingLarge),
                Text(
                  '🎉 Lesson Completed!',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                Text(
                  'Great job! You completed all pages of this lesson.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.paddingLarge),

                // Native Ad Card
                NativeAdCard(
                  title: 'Start Real Trading Today',
                  description:
                      'Apply your knowledge with real crypto trading on our platform.',
                  buttonText: 'Learn More',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Opening trading platform...'),
                      ),
                    );
                  },
                ),
                const SizedBox(height: AppConstants.paddingLarge),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusMedium,
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.pop(); // Close dialog
                      context.pop(); // Close content screen
                    },
                    child: const Text(
                      'Back to Lesson',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = pages[currentPageIndex];
    final totalPages = pages.length;
    final progressPercent = ((currentPageIndex + 1) / totalPages) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson Content'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          // Progress bar
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Page ${currentPageIndex + 1}/$totalPages',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${progressPercent.toStringAsFixed(0)}%',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.paddingSmall),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                  child: LinearProgressIndicator(
                    value: (currentPageIndex + 1) / totalPages,
                    minHeight: 8,
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Page title
                  Text(
                    currentPage.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingLarge),

                  // Content
                  Container(
                    padding: const EdgeInsets.all(AppConstants.paddingMedium),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.03),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.15),
                      ),
                      borderRadius: BorderRadius.circular(
                        AppConstants.radiusMedium,
                      ),
                    ),
                    child: Text(
                      currentPage.content,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(height: 1.6),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingLarge),

                  // Show ad on last page
                  if (currentPageIndex == totalPages - 1) ...[
                    NativeAdCard(
                      title: 'Ready to Trade?',
                      description:
                          'Practice with real charts and market data on our trading platform.',
                      buttonText: 'Start Trading',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Opening trading platform...'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppConstants.paddingLarge),
                  ],
                ],
              ),
            ),
          ),

          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            child: Row(
              children: [
                // Previous button
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusMedium,
                          ),
                        ),
                      ),
                      onPressed: currentPageIndex > 0
                          ? _goToPreviousPage
                          : null,
                      child: const Text(
                        'Previous',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingMedium),

                // Next button
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.primary.withOpacity(0.85),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusMedium,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _goToNextPage,
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusMedium,
                          ),
                          child: Center(
                            child: Text(
                              currentPageIndex == totalPages - 1
                                  ? 'Complete'
                                  : 'Next',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
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
        ],
      ),
    );
  }
}
