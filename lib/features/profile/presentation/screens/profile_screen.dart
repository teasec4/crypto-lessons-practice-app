import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';
import 'package:crypto_trading_lessons/features/profile/domain/entities/user.dart';
import 'package:crypto_trading_lessons/features/profile/domain/entities/achievement.dart';
import 'package:crypto_trading_lessons/features/profile/presentation/widgets/profile_header.dart';
import 'package:crypto_trading_lessons/features/profile/presentation/widgets/achievement_item.dart';
import 'package:crypto_trading_lessons/features/profile/presentation/widgets/settings_section.dart';
import 'package:crypto_trading_lessons/features/profile/presentation/widgets/theme_switcher.dart';
import 'package:crypto_trading_lessons/core/widgets/native_ad_card.dart';
import 'package:crypto_trading_lessons/features/lessons/data/lesson_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    // Get real user data from lessons
    final allLessons = LessonRepository.getAllLessons();
    final lessonsCompleted = allLessons.where((l) => l.isCompleted).length;
    final totalExp = lessonsCompleted * 250; // 250 EXP per lesson
    final userLevel = _calculateLevel(lessonsCompleted);

    // Create user data based on actual progress
    final mockUser = User(
      id: '1',
      name: 'Crypto Trader',
      email: 'trader@crypto.com',
      avatar: '',
      lessonsCompleted: lessonsCompleted,
      totalExp: totalExp,
      level: userLevel,
      joinDate: DateTime.now().subtract(const Duration(days: 30)),
    );

    // Achievements based on progress
    final mockAchievements = [
      Achievement(
        id: '1',
        title: 'First Step',
        description: 'Complete first lesson',
        icon: '🚀',
        unlocked: lessonsCompleted >= 1,
        unlockedAt: null,
      ),
      Achievement(
        id: '2',
        title: 'Quick Learner',
        description: 'Complete 5 lessons',
        icon: '📚',
        unlocked: lessonsCompleted >= 5,
        unlockedAt: null,
      ),
      Achievement(
        id: '3',
        title: 'Trading Master',
        description: 'Complete 10 lessons',
        icon: '🏆',
        unlocked: lessonsCompleted >= 10,
        unlockedAt: null,
      ),
      Achievement(
        id: '4',
        title: 'Legendary Trader',
        description: 'Complete all 15 lessons',
        icon: '⭐',
        unlocked: lessonsCompleted >= 15,
        unlockedAt: null,
      ),
      Achievement(
        id: '5',
        title: 'Intermediate Path',
        description: 'Unlock intermediate lessons',
        icon: '📈',
        unlocked: lessonsCompleted >= 5,
        unlockedAt: null,
      ),
      Achievement(
        id: '6',
        title: 'Advanced Mastery',
        description: 'Unlock advanced lessons',
        icon: '🎯',
        unlocked: lessonsCompleted >= 10,
        unlockedAt: null,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), elevation: 0),
      body: CustomScrollView(
        slivers: [
          // Profile Header
          SliverToBoxAdapter(child: ProfileHeader(user: mockUser)),

          // Achievements Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
                vertical: AppConstants.paddingMedium,
              ),
              child: Text(
                'Achievements',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                runSpacing: AppConstants.paddingMedium,
                children: mockAchievements
                    .map((a) => AchievementItem(achievement: a))
                    .toList(),
              ),
            ),
          ),

          // Native Ad - Sponsored Content
          SliverToBoxAdapter(
           child: Padding(
             padding: const EdgeInsets.all(AppConstants.paddingMedium),
             child: NativeAdCard(
               title: 'Boost Your Trading',
               description: 'Upgrade to Pro and unlock advanced strategies with real-time analytics.',
               buttonText: 'Explore Premium',
               onTap: () {
                 ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(
                     content: Text('Premium features coming soon'),
                   ),
                 );
               },
             ),
           ),
          ),

          // Settings Sections
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: AppConstants.paddingMedium),
                // Preferences Section with Theme Switcher
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingMedium,
                    vertical: AppConstants.paddingSmall,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preferences',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: AppConstants.paddingSmall),
                      // Theme Switcher
                      const ThemeSwitcher(),
                      Divider(height: 1, color: Colors.grey.withValues(alpha: 0.2)),
                      // Notifications Setting
                      ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: const Text('Notifications'),
                        subtitle: Text(notificationsEnabled ? 'Enabled' : 'Disabled'),
                        trailing: Switch(
                          value: notificationsEnabled,
                          onChanged: (value) {
                            setState(() {
                              notificationsEnabled = value;
                            });
                          },
                        ),
                      ),
                      Divider(height: 1, color: Colors.grey.withValues(alpha: 0.2)),
                      // Currency Setting
                      ListTile(
                        leading: Icon(
                          Icons.attach_money,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: const Text('Preferred Currency'),
                        subtitle: const Text('USD'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Currency settings')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SettingsSection(
                  title: 'Security',
                  tiles: [
                    SettingsTile(
                      title: 'Change Password',
                      icon: Icons.lock,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Change password')),
                        );
                      },
                    ),
                    SettingsTile(
                      title: 'Two-Factor Auth',
                      subtitle: 'Disabled',
                      icon: Icons.security,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Two-factor authentication'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SettingsSection(
                  title: 'General',
                  tiles: [
                    SettingsTile(
                      title: 'About',
                      icon: Icons.info,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('About app')),
                        );
                      },
                    ),
                    SettingsTile(
                      title: 'Logout',
                      icon: Icons.logout,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logging out...')),
                        );
                      },
                      showDivider: false,
                    ),
                  ],
                ),
              ],
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
      // Same as lessons screen
      // Level progression based on lessons completed (out of 15 total)
      // Newbie: 0-2 lessons
      // Trader: 3-7 lessons (finished beginner)
      // Advanced: 8-12 lessons (finished intermediate)
      // Master: 13-14 lessons
      // Legend: 15 lessons (all completed)
      if (lessonsCompleted >= 15) return 4;
      if (lessonsCompleted >= 13) return 3;
      if (lessonsCompleted >= 8) return 2;
      if (lessonsCompleted >= 3) return 1;
      return 0;
      }
      }
