import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';
import 'package:crypto_trading_lessons/features/wallet/domain/entities/crypto_asset.dart';

class AssetItem extends StatelessWidget {
  final CryptoAsset asset;
  final VoidCallback? onTap;

  const AssetItem({
    super.key,
    required this.asset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = asset.change24h >= 0;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingMedium,
          vertical: AppConstants.paddingSmall,
        ),
        child: Row(
          children: [
            // Coin icon placeholder
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.1),
              ),
              child: Center(
                child: Text(
                  asset.symbol[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppConstants.paddingMedium),

            // Coin info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${asset.balance.toStringAsFixed(4)} ${asset.symbol}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),

            // Price and change
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${asset.totalValue.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingSmall,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: isPositive
                        ? AppColors.success.withOpacity(0.1)
                        : AppColors.error.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusSmall),
                  ),
                  child: Text(
                    '${isPositive ? '+' : ''}${asset.change24h.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isPositive ? AppColors.success : AppColors.error,
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
