import 'crypto_asset.dart';

class Wallet {
  final String id;
  final String address;
  final List<CryptoAsset> assets;

  const Wallet({
    required this.id,
    required this.address,
    required this.assets,
  });

  double get totalBalance {
    return assets.fold(0, (sum, asset) => sum + asset.totalValue);
  }
}
