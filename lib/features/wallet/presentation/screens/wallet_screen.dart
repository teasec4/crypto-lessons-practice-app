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

    return Scaffold(
      appBar: AppBar(title: const Text('Wallet'), elevation: 0),
      body: CustomScrollView(
        slivers: [
          // Balance card
          SliverToBoxAdapter(
            child: BalanceCard(
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
            ),
          ),

          // CTA Section - Button and Native Ad
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Column(
                children: [
                  // Main button - Learn Trading
                  SizedBox(
                    width: double.infinity,
                    height: 56,
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
                            blurRadius: 8,
                            offset: const Offset(0, 2),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Start Learning',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  // Native Ad Card
                  NativeAdCard(
                    title: 'Ready to Trade?',
                    description:
                        'Practice with real charts and market data on our trading platform.',
                    buttonText: 'Start Trading',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Opening trading platform...'),
                        ),
                      );
                    },
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

          // Assets list
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
          ),

          // Bottom padding
          SliverToBoxAdapter(
            child: SizedBox(height: AppConstants.paddingMedium),
          ),
        ],
      ),
    );
  }
}
