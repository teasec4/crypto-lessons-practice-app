import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';
import 'package:crypto_trading_lessons/features/wallet/domain/entities/crypto_asset.dart';
import 'package:crypto_trading_lessons/features/wallet/domain/entities/wallet.dart';
import 'package:crypto_trading_lessons/features/wallet/presentation/widgets/balance_card.dart';
import 'package:crypto_trading_lessons/features/wallet/presentation/widgets/asset_item.dart';
import 'package:crypto_trading_lessons/core/widgets/native_ad_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock wallet data
    final mockAssets = [
      const CryptoAsset(
        id: '1',
        symbol: 'USDT',
        name: 'Tether',
        balance: 1000.50,
        price: 1.0,
        change24h: 0.01,
      ),
      const CryptoAsset(
        id: '2',
        symbol: 'BTC',
        name: 'Bitcoin',
        balance: 0.5234,
        price: 43250.00,
        change24h: 2.45,
      ),
      const CryptoAsset(
        id: '3',
        symbol: 'ETH',
        name: 'Ethereum',
        balance: 5.2341,
        price: 2350.00,
        change24h: -1.23,
      ),
      const CryptoAsset(
        id: '4',
        symbol: 'XRP',
        name: 'Ripple',
        balance: 250.0,
        price: 0.52,
        change24h: 1.15,
      ),
      const CryptoAsset(
        id: '5',
        symbol: 'SOL',
        name: 'Solana',
        balance: 12.5,
        price: 98.50,
        change24h: 3.67,
      ),
    ];

    final wallet = Wallet(
      id: '1',
      address: '0x742d35Cc6634C0532925a3b844Bc9e7595f42e0',
      assets: mockAssets,
    );

    // Mock: wallet locked until 5 lessons completed
    const lessonsCompleted = 3;
    const requiredLessons = 5;
    final isUnlocked = lessonsCompleted >= requiredLessons;

    return Scaffold(
      appBar: AppBar(title: const Text('Wallet'), elevation: 0),
      body: CustomScrollView(
        slivers: [
          // Balance card - show locked state if needed
          SliverToBoxAdapter(
            child: isUnlocked
                ? BalanceCard(
                    totalBalance: wallet.totalBalance,
                    onSend: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Send functionality')),
                      );
                    },
                    onReceive: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Receive functionality')),
                      );
                    },
                  )
                : _LockedBalanceCard(context, lessonsCompleted, requiredLessons),
          ),

          // CTA Section - Button and Native Ad
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Column(
                children: [
                  // Two buttons for locked state
                  if (!isUnlocked)
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.primary.withOpacity(0.8),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppConstants.radiusMedium,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    context.go('/lessons');
                                  },
                                  borderRadius: BorderRadius.circular(
                                    AppConstants.radiusMedium,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Continue Learning',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(
                                  AppConstants.radiusMedium,
                                ),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.lock,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Start Earning',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    // Main button for unlocked
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.primary.withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusMedium,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              context.go('/lessons');
                            },
                            borderRadius: BorderRadius.circular(
                              AppConstants.radiusMedium,
                            ),
                            child: const Center(
                              child: Text(
                                'Manage Assets',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: AppConstants.paddingSmall),
                  // Native Ad Card
                  NativeAdCard(
                    title: isUnlocked ? 'Ready to Trade?' : 'Earn Crypto',
                    description: isUnlocked
                        ? 'Start trading with real market data.'
                        : 'Complete lessons to unlock earning opportunities.',
                    buttonText: 'Learn More',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Opening...'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Info text for locked state
          if (!isUnlocked)
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(AppConstants.paddingMedium),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Complete your learning',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Finish $requiredLessons foundational lessons to unlock your wallet and start earning.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Assets header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
                vertical: AppConstants.paddingMedium,
              ),
              child: Text(
                'Your Assets',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),

          // Assets list - show locked version if not unlocked
          if (isUnlocked)
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return AssetItem(
                  asset: wallet.assets[index],
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${wallet.assets[index].name} tapped'),
                      ),
                    );
                  },
                );
              }, childCount: wallet.assets.length),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _LockedAssetItem(wallet.assets[index]);
              }, childCount: wallet.assets.length),
            ),

          // Bottom padding
          SliverToBoxAdapter(
            child: SizedBox(height: AppConstants.paddingMedium),
          ),
        ],
      ),
    );
  }

  Widget _LockedBalanceCard(
    BuildContext context,
    int lessonsCompleted,
    int requiredLessons,
  ) {
    final remaining = requiredLessons - lessonsCompleted;
    return Container(
      margin: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppConstants.paddingSmall),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                  ),
                  child: const Icon(
                    Icons.lock,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: AppConstants.paddingMedium),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Unlock to see your balance',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.grey[600],
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Text(
              '****',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
                letterSpacing: 12,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete $remaining more lesson${remaining != 1 ? 's' : ''}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                    child: LinearProgressIndicator(
                      value: lessonsCompleted / requiredLessons,
                      minHeight: 4,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _LockedAssetItem(CryptoAsset asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
        vertical: AppConstants.paddingSmall,
      ),
      child: Row(
        children: [
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  asset.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '**** ${asset.symbol}',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '****',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                ),
                child: const Text(
                  '****',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
