class CryptoAsset {
  final String id;
  final String symbol; // BTC, ETH, USDT
  final String name;
  final double balance;
  final double price; // USD price
  final double change24h; // percentage

  const CryptoAsset({
    required this.id,
    required this.symbol,
    required this.name,
    required this.balance,
    required this.price,
    required this.change24h,
  });

  double get totalValue => balance * price;
}
