import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_trading_lessons/core/routing/app_router.dart';
import 'package:crypto_trading_lessons/core/constants/app_colors.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _getCurrentIndex(context),
          onTap: (index) => _navigateTo(context, index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Lessons',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Practice',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    switch (location) {
      case AppRouter.lessonsRoute:
        return 0;
      case AppRouter.walletRoute:
        return 1;
      case AppRouter.practiceRoute:
        return 2;
      case AppRouter.profileRoute:
        return 3;
      default:
        return 0;
    }
  }

  void _navigateTo(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRouter.lessonsRoute);
        break;
      case 1:
        context.go(AppRouter.walletRoute);
        break;
      case 2:
        context.go(AppRouter.practiceRoute);
        break;
      case 3:
        context.go(AppRouter.profileRoute);
        break;
    }
  }
}
