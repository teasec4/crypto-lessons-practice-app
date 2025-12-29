import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';

class BalanceCard extends StatelessWidget {
  final double totalBalance;
  final VoidCallback onSend;
  final VoidCallback onReceive;

  const BalanceCard({
    super.key,
    required this.totalBalance,
    required this.onSend,
    required this.onReceive,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Balance',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: AppConstants.paddingMedium),

            // Balance amount
            Text(
              '\$${totalBalance.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),

            // Send and Receive buttons
            Row(
              children: [
                Expanded(
                  child: _ActionButton(
                    icon: Icons.arrow_upward,
                    label: 'Send',
                    onTap: onSend,
                  ),
                ),
                const SizedBox(width: AppConstants.paddingMedium),
                Expanded(
                  child: _ActionButton(
                    icon: Icons.arrow_downward,
                    label: 'Receive',
                    onTap: onReceive,
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

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.paddingMedium,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
