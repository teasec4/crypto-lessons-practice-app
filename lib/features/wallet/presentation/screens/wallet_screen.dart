import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';
import 'package:crypto_trading_lessons/features/wallet/domain/entities/crypto_asset.dart';
import 'package:crypto_trading_lessons/features/wallet/domain/entities/wallet.dart';
import 'package:crypto_trading_lessons/features/wallet/presentation/widgets/balance_card.dart';
import 'package:crypto_trading_lessons/features/wallet/presentation/widgets/asset_item.dart';

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
      appBar: AppBar(
        title: const Text('Wallet'),
        elevation: 0,
      ),
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
            delegate: SliverChildBuilderDelegate(
              (context, index) {
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
              },
              childCount: wallet.assets.length,
            ),
          ),

          // Bottom padding
          SliverToBoxAdapter(
            child: SizedBox(
              height: AppConstants.paddingMedium,
            ),
          ),
        ],
      ),
    );
  }
}
