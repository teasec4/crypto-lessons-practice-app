import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data - количество пройденных уроков
    const lessonsCompleted = 3;
    const requiredLessons = 5;
    final isUnlocked = lessonsCompleted >= requiredLessons;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
        elevation: 0,
      ),
      body: isUnlocked
          ? _UnlockedContent(context)
          : _LockedContent(
              context,
              lessonsCompleted: lessonsCompleted,
              requiredLessons: requiredLessons,
            ),
    );
  }

  Widget _UnlockedContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trading Simulator',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primary.withOpacity(0.3),
              ),
              borderRadius:
                  BorderRadius.circular(AppConstants.radiusMedium),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ready to Trade',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppConstants.paddingSmall),
                Text(
                  'Practice real trading with virtual money. Trade crypto pairs, test strategies, and learn without risk.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppConstants.paddingLarge),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingMedium,
                        vertical: AppConstants.paddingSmall,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusSmall,
                        ),
                      ),
                      child: const Text(
                        'Features:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                ...[
                  'Currency exchange simulator',
                  'Virtual wallet with \$10,000 starting balance',
                  'Real-time price charts',
                  'Buy/Sell functionality',
                  'Trade history and statistics',
                  'Risk management tools',
                ]
                    .map(
                      (feature) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppConstants.paddingSmall,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 18,
                              color: AppColors.success,
                            ),
                            const SizedBox(
                              width: AppConstants.paddingMedium,
                            ),
                            Text(
                              feature,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.paddingLarge),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusMedium),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Opening trading simulator...'),
                  ),
                );
              },
              child: const Text(
                'Start Trading',
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
    );
  }

  Widget _LockedContent(
    BuildContext context, {
    required int lessonsCompleted,
    required int requiredLessons,
  }) {
    final remaining = requiredLessons - lessonsCompleted;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.1),
              ),
              child: const Center(
                child: Icon(
                  Icons.lock,
                  size: 50,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Text(
              'Practice Locked',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            Text(
              'Complete beginner lessons to unlock the trading simulator',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.2),
                ),
                borderRadius:
                    BorderRadius.circular(AppConstants.radiusMedium),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progress',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '$lessonsCompleted/$requiredLessons',
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusSmall),
                    child: LinearProgressIndicator(
                      value: lessonsCompleted / requiredLessons,
                      minHeight: 8,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingMedium,
                      vertical: AppConstants.paddingSmall,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                        AppConstants.radiusSmall,
                      ),
                    ),
                    child: Text(
                      'Complete $remaining more lesson${remaining != 1 ? 's' : ''} to unlock',
                      style: TextStyle(
                        color: AppColors.warning,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Text(
              'Why practice first?',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: AppConstants.paddingSmall),
            ...[
              'Learn trading fundamentals safely',
              'Build confidence with virtual money',
              'Master strategies before risking real funds',
            ]
                .map(
                  (reason) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppConstants.paddingSmall,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: AppColors.success,
                        ),
                        const SizedBox(
                          width: AppConstants.paddingSmall,
                        ),
                        Expanded(
                          child: Text(
                            reason,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
