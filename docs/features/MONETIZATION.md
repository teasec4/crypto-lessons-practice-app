# Monetization Strategy

Native ads, premium features, and revenue model overview.

## Overview

Monetization focuses on non-intrusive native advertising and premium features. The goal: engage users with educational content first, then offer value-added paid features without disrupting the learning experience.

## Current Implementation

### Native Ad Card Component
```dart
// lib/core/widgets/native_ad_card.dart
class NativeAdCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTap;
  final String? imageUrl;
}
```

**Design:**
- Left: Icon with gradient background
- Right: Title (2 lines max) + Description (2 lines max)
- Bottom: "Sponsored" label for transparency
- Button: Full width, gradient styled, shadows

**Usage:** Import from core/widgets, pass custom copy

---

## Ad Placements

### 1. Lessons Screen
**Location:** After lesson completion dialog
**Impression:** When user finishes a lesson
**Copy:** "Ready to Trade?"
**Description:** "Start real trading today with our simulator"
**Button:** "Explore Trading"
**Goal:** Drive users to practice screen

**File:** `lib/features/lessons/presentation/screens/lesson_content_screen.dart`

**Code:**
```dart
if (currentPage == totalPages) {
  NativeAdCard(
    title: 'Ready to Trade?',
    description: 'Start real trading today...',
    buttonText: 'Explore Trading',
    onTap: () { /* navigate to practice */ }
  )
}
```

### 2. Practice Screen (Locked State)
**Location:** Below "Continue Lessons" CTA button
**Impression:** When user views locked practice
**Copy:** "Boost Your Trading"
**Description:** "Unlock advanced strategies and real-time analytics"
**Button:** "Explore Premium"
**Goal:** Sell premium features to engaged users

**File:** `lib/features/practice/presentation/screens/practice_screen.dart`

**Code:**
```dart
NativeAdCard(
  title: 'Boost Your Trading',
  description: 'Unlock advanced strategies...',
  buttonText: 'Explore Premium',
  onTap: () { /* premium modal */ }
)
```

### 3. Practice Screen (Unlocked State)
**Location:** Below "Start Trading" button
**Impression:** When user can already practice
**Copy:** "Advanced Trading Tools"
**Description:** "Take your practice trading to the next level"
**Button:** "Learn More"
**Goal:** Up-sell advanced features

### 4. Wallet Screen
**Location:** Below "Start Learning" CTA button
**Impression:** When user views portfolio
**Copy:** "Ready to Trade?"
**Description:** "Upgrade to Pro and unlock advanced strategies"
**Button:** "Explore Premium"
**Goal:** Cross-sell trading features

**File:** `lib/features/wallet/presentation/screens/wallet_screen.dart`

### 5. Profile Screen (New - Session 4)
**Location:** Between achievements and settings sections
**Impression:** When user reviews progress
**Copy:** "Boost Your Trading"
**Description:** "Unlock advanced strategies with real-time analytics"
**Button:** "Explore Premium"
**Goal:** Monetize engaged, high-level users

**File:** `lib/features/profile/presentation/screens/profile_screen.dart`

---

## Ad Placement Strategy

### Placement Principles
1. **Natural Stopping Points** — Show ads after user completes action
2. **Secondary Position** — Never interrupt primary flow
3. **Contextually Relevant** — Ads match user's current goal
4. **Transparent** — Always label as "Sponsored"
5. **Value-Aligned** — Offer something useful, not annoying

### Frequency
- No more than 1 ad per screen
- Wait 3-5 screens before showing again
- Don't show on first lesson (let users get engaged first)

### Hierarchy
```
Primary Action Button (Learn, Continue, Start)
    ↓
Secondary Engagement (Native Ad)
    ↓
Additional Options (Navigation, Settings)
```

---

## Premium Features (Planned)

### Phase 2: Basic Premium
- [ ] Advanced charting tools
- [ ] Real-time price alerts
- [ ] Unlimited practice trades
- [ ] Trading history analytics

**Price:** $2.99/month or $19.99/year

### Phase 3: Pro Premium
- [ ] WebSocket real-time data
- [ ] Expert trading signals
- [ ] Portfolio recommendations
- [ ] Live market news feed

**Price:** $9.99/month or $79.99/year

### Phase 4: Elite
- [ ] Personal trading advisor (chatbot)
- [ ] Advanced algorithms
- [ ] Exclusive trading strategies
- [ ] VIP leaderboard

**Price:** $29.99/month or $249.99/year

---

## Revenue Model

### Current (MVP)
- **Revenue:** $0 (Pre-monetization)
- **Focus:** User acquisition & engagement

### Phase 2
- **Primary:** In-app ads (Google AdMob)
- **Secondary:** Premium subscriptions (basic tier)
- **Target:** $0.50 - $1.00 per active user per month

### Phase 3
- **Primary:** Premium subscriptions (30% of users)
- **Secondary:** Affiliate links (crypto exchanges)
- **Tertiary:** In-app ads
- **Target:** $2-5 per paying user per month

### Phase 4
- **Primary:** Premium subscriptions (50% of users)
- **Secondary:** Affiliate revenue
- **Tertiary:** Sponsored content (crypto projects)
- **Target:** $5-10 per paying user per month

---

## Ad Integration with Google AdMob

### Current State
- Mock data (NativeAdCard with custom content)
- Ready for AdMob integration

### Planned (Phase 2)
```dart
// Add google_mobile_ads package to pubspec.yaml
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Initialize in main.dart
void main() {
  MobileAds.initialize();
  runApp(MyApp());
}

// Load ads
final _adLoader = NativeAdLoader(
  adUnitId: 'ca-app-pub-xxxxxxxxxxxxxxxx/xxxxxxxxxxxxxxxx',
  listener: NativeAdListener(
    onAdLoaded: (ad) { /* show ad */ },
    onAdFailedToLoad: (error) { /* handle error */ },
  ),
);
```

### Ad Unit IDs
- **Lessons Ad:** [To be created in AdMob]
- **Practice Ad:** [To be created in AdMob]
- **Wallet Ad:** [To be created in AdMob]
- **Profile Ad:** [To be created in AdMob]

### Testing IDs
```dart
// Use these during development
const String _kTestDeviceId = 'YOUR_DEVICE_ID';
RequestConfiguration requestConfiguration = RequestConfiguration(
  keywords: <String>['finance', 'crypto', 'trading'],
);
MobileAds.setRequestConfiguration(requestConfiguration);
```

---

## Consent & Privacy

### GDPR/CCPA Compliance
- User consent collection before ads
- Privacy policy in app (About section)
- Data transparency

### Implementation (Phase 2)
```dart
// User Messaging Platform (UMP) integration
import 'package:google_user_messaging_platform/google_user_messaging_platform.dart';

// Load and show consent form if needed
_umo.requestConsentInfoUpdate(
  consentRequestParameters: ConsentRequestParameters(),
  onSuccess: (consentInfo) => _loadConsentForm(),
  onFailure: (formError) => handleError(),
);
```

---

## Analytics & Metrics

### Key Metrics to Track
- **Ad Impressions:** How many times ads shown
- **Click-Through Rate (CTR):** % of impressions that lead to clicks
- **Conversion Rate:** % of clicks that lead to premium signup
- **Lifetime Value (LTV):** Average revenue per user

### Implementation (Phase 2)
```dart
// Firebase Analytics integration
import 'package:firebase_analytics/firebase_analytics.dart';

// Track ad events
analytics.logEvent(
  name: 'ad_impression',
  parameters: {
    'ad_placement': 'lessons_screen',
    'ad_type': 'native',
    'user_level': 2,
  },
);

analytics.logEvent(
  name: 'ad_click',
  parameters: {
    'ad_placement': 'practice_screen',
    'premium_tier': 'basic',
  },
);
```

### Targets
- **CTR Goal:** 2-5%
- **Conversion Goal:** 2-10% of clickers
- **Premium Adoption:** 5-15% of active users by Month 3

---

## Code Examples

### Basic Ad Card Usage
```dart
NativeAdCard(
  title: 'Feature Name',
  description: 'Feature description here',
  buttonText: 'Call To Action',
  onTap: () {
    // Handle click
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ad clicked')),
    );
  },
)
```

### With Navigation
```dart
NativeAdCard(
  title: 'Ready to Trade?',
  description: 'Start practicing with our simulator',
  buttonText: 'Start Now',
  onTap: () {
    context.go('/practice');
  },
)
```

### Conditional Display
```dart
if (userLevel >= 2) {  // Only show to engaged users
  NativeAdCard(
    title: 'Upgrade to Pro',
    description: 'Unlock advanced features',
    buttonText: 'Learn More',
    onTap: _showPremiumModal,
  )
}
```

---

## Testing Ads

### Manual Testing
1. [ ] Ad displays correctly on mobile
2. [ ] Ad displays correctly on tablet
3. [ ] Button taps work
4. [ ] Layout doesn't break
5. [ ] Text truncates properly
6. [ ] On dark mode
7. [ ] On light mode

### Device Testing
- [ ] Android phone
- [ ] Android tablet
- [ ] iOS phone
- [ ] iOS tablet

---

## Files & Organization

### Core Component
- `lib/core/widgets/native_ad_card.dart` — Reusable ad component

### Implementations
- `lib/features/lessons/presentation/screens/lesson_content_screen.dart`
- `lib/features/practice/presentation/screens/practice_screen.dart`
- `lib/features/wallet/presentation/screens/wallet_screen.dart`
- `lib/features/profile/presentation/screens/profile_screen.dart`

### Future (Phase 2)
- `lib/features/monetization/data/ad_repository.dart`
- `lib/features/monetization/presentation/screens/premium_screen.dart`
- `lib/features/monetization/domain/entities/premium_tier.dart`

---

## Related Documentation
- [PROGRESS.md](../../PROGRESS.md) — Feature status
- [docs/features/LESSONS.md](LESSONS.md) — Lesson placements
- [docs/features/PRACTICE.md](PRACTICE.md) — Practice placements
- [docs/features/WALLET.md](WALLET.md) — Wallet placements
- [docs/features/PROFILE.md](PROFILE.md) — Profile placements
- [docs/00_vision.md](../00_vision.md) — Overall project goals

---

## Next Steps

1. **Phase 2:**
   - [ ] Integrate Google AdMob SDK
   - [ ] Create ad unit IDs in AdMob console
   - [ ] Implement consent flow
   - [ ] Setup Firebase Analytics
   - [ ] Create premium tier system
   - [ ] Test on real devices

2. **Phase 3:**
   - [ ] Monitor ad performance
   - [ ] A/B test different ad creatives
   - [ ] Optimize placement based on data
   - [ ] Launch premium subscriptions
   - [ ] Setup affiliate partnerships

3. **Phase 4:**
   - [ ] Implement advanced targeting
   - [ ] Launch sponsored content partnerships
   - [ ] Develop premium feature roadmap
   - [ ] Scale ad network

---

Last Updated: Session 4, 2025-12-29
