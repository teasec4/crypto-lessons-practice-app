# Wallet Feature

Virtual cryptocurrency wallet with multi-asset support.

## Overview

Users manage a virtual crypto portfolio with realistic assets, balances, and price tracking. The wallet serves as the economic center of the app where users see their trading results and potential earnings.

## Current Features

### Assets Supported (5 Cryptocurrencies)
1. **USDT** (Tether)
   - Balance: 500
   - Price: $1.00
   - 24h Change: +0.2%

2. **BTC** (Bitcoin)
   - Balance: 0.25
   - Price: $45,230
   - 24h Change: +3.5%

3. **ETH** (Ethereum)
   - Balance: 2.5
   - Price: $2,850
   - 24h Change: -1.2%

4. **XRP** (Ripple)
   - Balance: 500
   - Price: $0.52
   - 24h Change: +5.1%

5. **SOL** (Solana)
   - Balance: 5
   - Price: $195.40
   - 24h Change: +8.3%

### Starting Balance
- **Total:** ~$13,000+ USD equivalent
- **Distribution:** Mix of stable coins + major alts

---

## Architecture

### Entities
```dart
// lib/features/wallet/domain/entities/crypto_asset.dart
class CryptoAsset {
  final String symbol;        // BTC, ETH, USDT, etc.
  final String name;
  final double balance;       // How much user has
  final double currentPrice;  // Price per unit
  final double change24h;     // % change in 24h
}

// lib/features/wallet/domain/entities/wallet.dart
class Wallet {
  final String id;
  final String address;       // Mock wallet address
  final List<CryptoAsset> assets;
  
  double getTotalBalance() => /* sum in USD */
}
```

### Repository
```dart
// lib/features/wallet/presentation/screens/wallet_screen.dart
// Currently: Mock data in screen
// Future: lib/features/wallet/data/wallet_repository.dart
```

### Mock Data
Hard-coded in `wallet_screen.dart` (lines ~50):
- Wallet address
- 5 assets with balances and prices
- Ready to move to repository in Phase 2

---

## Screens

### Wallet Screen (`wallet_screen.dart`)
Main wallet interface.

**Layout (CustomScrollView):**
1. **Total Balance Card** (top)
   - Animated entrance (0.95 → 1.0 scale)
   - Large balance number ($13,245.78)
   - Subtitle: "Your crypto portfolio"
   - Trending badge (📈 +2.3% today)
   - Send/Receive buttons

2. **Assets List** (middle)
   - Asset items in list
   - Symbol, name, balance, price
   - 24h change with color coding (green +, red -)

3. **CTA Section** (bottom)
   - "Start Learning" button (full width)
   - Native ad card (monetization)

**Features:**
- Responsive layout
- Animation on load
- Color-coded gains/losses
- Easy navigation to other sections

---

## UI Components

### Balance Card
```dart
// lib/features/wallet/presentation/widgets/balance_card.dart
class BalanceCard extends StatefulWidget {
  - Animated scale entrance
  - Gradient background
  - Shadow depth effects
  - Trending indicator
}
```

**Visual Design:**
- Blue-purple gradient
- White text
- Large typography (balance)
- Small subtitle text
- Action buttons inline

### Asset Item
```dart
// lib/features/wallet/presentation/widgets/asset_item.dart
class AssetItem extends StatelessWidget {
  - Symbol & name on left
  - Balance in center
  - Price & 24h change on right
  - Color-coded change (green/red)
}
```

**Visual Design:**
- Consistent padding
- Icon for each asset
- Three-column layout
- Touch-friendly sizing

---

## Navigation

### Routes
```dart
/wallet → WalletScreen (tab 2)
```

### Navigation Flow
- **From bottom nav:** Tap wallet tab
- **To lessons:** "Start Learning" button → `/lessons`
- **To trading:** (future) Buy/sell → opens trading interface

### CTA Button
- Links to `/lessons` for educational path
- Encourages learning before trading

---

## Monetization

### Native Ads Integration

**Placement:** Below CTA button
- Message: "Ready to Trade?"
- Description: "Upgrade to Pro and unlock advanced strategies with real-time analytics."
- Button: "Explore Premium"
- Component: NativeAdCard from core/widgets/

**Logic:**
- Shows in both empty and populated wallet states
- Encourages premium features
- Natural progression: Learn → Practice → Upgrade

---

## State Management

### Current (Session 4)
```dart
Widget build(BuildContext context) {
  // Mock wallet data in build method
  final mockWallet = Wallet(
    id: '1',
    address: '0x742d35Cc6634C0532925a3b844Bc9e7595f42e0',
    assets: [/* 5 assets */],
  );
  
  return /* build UI */
}
```

**Issues:**
- Data in presentation layer
- No persistence
- No sync with practice trades (future)

### Planned (Phase 2)
```dart
// With BLoC/Provider
final walletBloc = context.read<WalletBloc>();
final wallet = walletBloc.state.wallet;

// In practice, when user makes a trade:
// context.read<WalletBloc>().add(UpdateBalanceEvent(...))
```

**Benefits:**
- Separation of concerns
- Persistent storage
- Synced with practice trades
- User-specific data

---

## Animations

### Balance Card Entrance
- **Start:** Scale 0.95 (90% size)
- **End:** Scale 1.0 (full size)
- **Duration:** 600ms
- **Curve:** easeOut
- **Trigger:** On screen load

**Purpose:** Draw attention to total balance, make entrance feel polished

---

## Future Implementation

### Phase 2: Trading Integration
1. **Sync with Practice**
   - Practice trades update wallet balance
   - Real-time updates

2. **Transaction History**
   - Log of all trades
   - Buy/sell price tracking
   - Profit/loss per trade

3. **Deposit/Withdrawal**
   - Faucet to add test funds
   - Reset to default balance

### Phase 3: Real Data
- WebSocket for real crypto prices
- Live market data
- Price alerts
- Advanced charting

### Phase 4: Advanced Features
- Multi-chain support
- Token swaps
- DeFi integration
- Portfolio analytics

---

## Key Files

### Screen
- `lib/features/wallet/presentation/screens/wallet_screen.dart`

### Widgets
- `lib/features/wallet/presentation/widgets/balance_card.dart`
- `lib/features/wallet/presentation/widgets/asset_item.dart`
- `lib/core/widgets/native_ad_card.dart` (shared)

### Entities
- `lib/features/wallet/domain/entities/wallet.dart`
- `lib/features/wallet/domain/entities/crypto_asset.dart`

### Future
- `lib/features/wallet/data/wallet_repository.dart` (Phase 2)
- `lib/features/wallet/presentation/widgets/transaction_list.dart` (Phase 2)

---

## Code Patterns

### Calculate Total Balance
```dart
double getTotalBalance(List<CryptoAsset> assets) {
  return assets.fold<double>(
    0,
    (sum, asset) => sum + (asset.balance * asset.currentPrice),
  );
}
```

### Format Price Display
```dart
Text('$${asset.currentPrice.toStringAsFixed(2)}')
```

### Color-Code Changes
```dart
Color _getChangeColor(double change24h) {
  return change24h >= 0 ? AppColors.success : AppColors.error;
}
```

---

## Testing

### Test Cases
- [ ] Balance card displays correct total
- [ ] Assets list shows all 5 cryptocurrencies
- [ ] Prices display correctly formatted
- [ ] 24h changes show with correct color
- [ ] Balance card animation plays
- [ ] "Start Learning" button navigates
- [ ] Native ad displays
- [ ] No layout issues on mobile/tablet

### Manual Testing Checklist
- [ ] Screen loads with animation
- [ ] All 5 assets visible
- [ ] Green indicators for positive changes
- [ ] Red indicators for negative changes
- [ ] Button clicks navigate correctly
- [ ] Ads display below CTA
- [ ] Scrolling works smoothly
- [ ] Responsive on different screen sizes

---

## Design System Reference

### Colors
- **Background:** Light theme / Dark theme adaptive
- **Cards:** White with subtle shadow
- **Primary:** Blue gradient (AppColors.primary)
- **Success:** Green (positive changes)
- **Error:** Red (negative changes)

### Typography
- **Balance:** headlineLarge (large, bold)
- **Subtitle:** bodySmall (grey, subtle)
- **Asset name:** bodyMedium
- **Price:** bodySmall (right-aligned)

### Spacing
- Card padding: AppConstants.paddingLarge
- Item padding: AppConstants.paddingMedium
- Gap between sections: AppConstants.paddingLarge

---

## Related Features
- **Lessons:** Educational path leads to wallet
- **Practice:** Trades update wallet balance (Phase 2)
- **Profile:** Wallet stats contribute to achievements (future)

---

## References
- [PROGRESS.md](../../PROGRESS.md) — Overall progress
- [.development-workflow.md](../../.development-workflow.md) — How to work on this
- [docs/features/PRACTICE.md](PRACTICE.md) — How practice integrates
- [docs/features/MONETIZATION.md](MONETIZATION.md) — Ad integration
- [docs/UI_COMPONENTS.md](../UI_COMPONENTS.md) — Design system

---

Last Updated: Session 4, 2025-12-29
