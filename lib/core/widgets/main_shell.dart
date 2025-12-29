import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_trading_lessons/core/routing/app_router.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
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
      case AppRouter.profileRoute:
        return 2;
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
        context.go(AppRouter.profileRoute);
        break;
    }
  }
}
