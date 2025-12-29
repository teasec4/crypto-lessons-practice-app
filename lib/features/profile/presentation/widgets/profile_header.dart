import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';
import 'package:crypto_trading_lessons/features/profile/domain/entities/user.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  const ProfileHeader({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          children: [
            // Avatar
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  user.name[0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.paddingMedium),

            // Name and email
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              user.email,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: AppConstants.paddingMedium),

            // Level and Experience
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(
                  label: 'Level',
                  value: user.level.toString(),
                ),
                _StatItem(
                  label: 'Lessons',
                  value: user.lessonsCompleted.toString(),
                ),
                _StatItem(
                  label: 'EXP',
                  value: '${user.totalExp}',
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingMedium),

            // Experience progress bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progress to Level ${user.level + 1}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusSmall),
                  child: LinearProgressIndicator(
                    value: user.progressToNextLevel,
                    minHeight: 6,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
