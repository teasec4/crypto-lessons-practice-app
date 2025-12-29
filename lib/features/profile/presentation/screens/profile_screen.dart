import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';
import 'package:crypto_trading_lessons/features/profile/domain/entities/user.dart';
import 'package:crypto_trading_lessons/features/profile/domain/entities/achievement.dart';
import 'package:crypto_trading_lessons/features/profile/presentation/widgets/profile_header.dart';
import 'package:crypto_trading_lessons/features/profile/presentation/widgets/achievement_item.dart';
import 'package:crypto_trading_lessons/features/profile/presentation/widgets/settings_section.dart';
import 'package:crypto_trading_lessons/core/widgets/native_ad_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    // Mock user data
    final mockUser = User(
      id: '1',
      name: 'Alex Trader',
      email: 'alex.trader@crypto.com',
      avatar: '',
      lessonsCompleted: 7,
      totalExp: 2450,
      level: 3,
      joinDate: DateTime.now().subtract(const Duration(days: 45)),
    );

    // Mock achievements
    final mockAchievements = [
      const Achievement(
        id: '1',
        title: 'First Step',
        description: 'Complete first lesson',
        icon: '🚀',
        unlocked: true,
        unlockedAt: null,
      ),
      const Achievement(
        id: '2',
        title: 'Quick Learner',
        description: 'Complete 5 lessons',
        icon: '📚',
        unlocked: true,
        unlockedAt: null,
      ),
      const Achievement(
        id: '3',
        title: 'Trading Master',
        description: 'Complete 10 lessons',
        icon: '🏆',
        unlocked: false,
        unlockedAt: null,
      ),
      const Achievement(
        id: '4',
        title: 'Millionaire',
        description: 'Reach \$1M balance',
        icon: '💰',
        unlocked: false,
        unlockedAt: null,
      ),
      const Achievement(
        id: '5',
        title: 'Streak Master',
        description: '7 day streak',
        icon: '🔥',
        unlocked: true,
        unlockedAt: null,
      ),
      const Achievement(
        id: '6',
        title: 'Perfect Score',
        description: 'Score 100% on 3 lessons',
        icon: '⭐',
        unlocked: false,
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
                SettingsSection(
                  title: 'Preferences',
                  tiles: [
                    SettingsTile(
                      title: 'Notifications',
                      subtitle: notificationsEnabled ? 'Enabled' : 'Disabled',
                      icon: Icons.notifications,
                      trailing: Switch(
                        value: notificationsEnabled,
                        onChanged: (value) {
                          setState(() {
                            notificationsEnabled = value;
                          });
                        },
                      ),
                    ),
                    SettingsTile(
                      title: 'Preferred Currency',
                      subtitle: 'USD',
                      icon: Icons.attach_money,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Currency settings')),
                        );
                      },
                    ),
                  ],
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
}
