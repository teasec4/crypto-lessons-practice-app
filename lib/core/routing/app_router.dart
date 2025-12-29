import 'package:go_router/go_router.dart';
import 'package:crypto_trading_lessons/features/lessons/presentation/screens/lessons_screen.dart';
import 'package:crypto_trading_lessons/features/lessons/presentation/screens/lesson_detail_screen.dart';
import 'package:crypto_trading_lessons/features/lessons/presentation/screens/lesson_content_screen.dart';
import 'package:crypto_trading_lessons/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:crypto_trading_lessons/features/practice/presentation/screens/practice_screen.dart';
import 'package:crypto_trading_lessons/features/profile/presentation/screens/profile_screen.dart';
import 'package:crypto_trading_lessons/core/widgets/main_shell.dart';

final class AppRouter {
  static const String lessonsRoute = '/lessons';
  static const String lessonDetailRoute = '/lessons/:id';
  static const String lessonContentRoute = '/lessons/:id/content';
  static const String walletRoute = '/wallet';
  static const String practiceRoute = '/practice';
  static const String profileRoute = '/profile';

  static final GoRouter router = GoRouter(
    initialLocation: lessonsRoute,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: lessonsRoute,
            name: 'lessons',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const LessonsScreen()),
            routes: [
              GoRoute(
                path: ':id',
                name: 'lessonDetail',
                builder: (context, state) {
                  final lessonId = int.parse(state.pathParameters['id'] ?? '0');
                  return LessonDetailScreen(lessonId: lessonId);
                },
                routes: [
                  GoRoute(
                    path: 'content',
                    name: 'lessonContent',
                    builder: (context, state) {
                      final lessonId = int.parse(
                        state.pathParameters['id'] ?? '0',
                      );
                      return LessonContentScreen(lessonId: lessonId);
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: walletRoute,
            name: 'wallet',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const WalletScreen()),
          ),
          GoRoute(
            path: practiceRoute,
            name: 'practice',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const PracticeScreen()),
          ),
          GoRoute(
            path: profileRoute,
            name: 'profile',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const ProfileScreen()),
          ),
        ],
      ),
    ],
  );
}
