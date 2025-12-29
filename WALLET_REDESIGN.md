# Wallet Screen Redesign - Session 4

## Overview

The Wallet screen has been significantly improved with a more attractive Total Balance card and professional CTA (Call-to-Action) buttons in native ad card style. The CTA buttons are now positioned right after the wallet balance and before the assets list.

## Changes Made

### 1. Total Balance Card Enhancement

**File:** `lib/features/wallet/presentation/widgets/balance_card.dart`

**Improvements:**
- ✨ Added entrance animation (scale transition) for visual polish
- 📦 Converted from StatelessWidget to StatefulWidget
- 🎨 Enhanced visual hierarchy with better shadows and depth
- 📝 Added subtitle "Your crypto portfolio" for context
- 💚 Improved trending badge styling with icon and border
- 🎭 Added BackdropFilter for glassmorphism effect
- 📐 Larger balance amount (48px → was 42px) for more prominence
- ✅ Better spacing and typography

**New Features:**
```dart
// Scale animation on load
_scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
  CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
);

// Enhanced trending badge
Container(
  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
    color: Colors.green.withOpacity(0.25),
    border: Border.all(color: Colors.green.withOpacity(0.4)),
  ),
  child: Row(
    children: [
      Icon(Icons.trending_up, color: Colors.green[300], size: 14),
      Text('+2.45% this week'),
    ]
  )
)
```

### 2. CTA Button + Native Ad Card

**File:** `lib/features/wallet/presentation/screens/wallet_screen.dart`

**New Layout:**
- Positioned right after balance card
- BEFORE "Your Assets" section
- Main button for learning + native ad below

**Layout Structure:**
```
Balance Card
     ↓
[Start Learning Button]  ← Primary action
     ↓
[Ready to Trade? Ad]     ← Native ad card
     ↓
Your Assets
[Asset 1]
[Asset 2]
...
```

**Button Details:**

#### Start Learning Button (Primary)
- Icon: 🎓 School icon
- Text: "Start Learning"
- Action: Navigate to `/lessons`
- Style: Blue gradient background
- Height: 56px
- Effect: Full width, gradient + shadow
- Visual prominence for main learning path

#### Ready to Trade? Native Ad Card
- Title: "Ready to Trade?"
- Description: "Practice with real charts and market data on our trading platform."
- Button: "Start Trading"
- Action: Shows snackbar "Opening trading platform..."
- Style: Native ad card styling (matching lessons)
- "Sponsored" label at bottom for transparency

**Visual Design:**
- Button: AppColors.primary gradient with white text
- Ad Card: Border + subtle background (consistent with NativeAdCard)
- Spacing: paddingMedium between elements

### 3. Responsive Design

- Full width button (no side margins)
- Full width native ad card
- Vertical stack (Column) for clarity
- Touch-friendly sizes (56px button height)
- Works on all screen sizes

## Code Structure

### Balance Card Animation
```dart
@override
void initState() {
  super.initState();
  _animationController = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  );
  
  _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
    CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
  );
  
  _animationController.forward();
}
```

### CTA Button + Native Ad Layout
```dart
// In CustomScrollView (after BalanceCard):
Column(
  children: [
    // Main button - full width
    SizedBox(
      width: double.infinity,
      height: 56,
      child: Container(
        // Blue gradient styling
        child: Material(
          child: InkWell(
            onTap: () => context.go('/lessons'),
            // Button content
          ),
        ),
      ),
    ),
    const SizedBox(height: AppConstants.paddingMedium),
    // Native Ad Card
    NativeAdCard(
      title: 'Ready to Trade?',
      description: 'Practice with real charts...',
      buttonText: 'Start Trading',
      onTap: () => showSnackBar(),
    ),
  ],
)
```

### Native Ad Integration
- Uses the same `NativeAdCard` widget from lessons
- Familiar layout and styling for users
- Consistent brand experience across app
- "Sponsored" label maintains transparency
- Monetization-friendly placement

## Testing Checklist

### Balance Card
- [x] Balance card displays correctly
- [x] Animation plays smoothly on load
- [x] Trending badge shows with icon
- [x] Card shows "Your crypto portfolio" subtitle
- [x] Send/Receive buttons are functional

### Start Learning Button
- [x] Button appears AFTER balance card
- [x] Full width button displays correctly
- [x] Blue gradient styling applied
- [x] School icon shows correctly
- [x] "Start Learning" text is readable
- [x] Button navigates to /lessons on tap
- [x] Shadow effect visible
- [x] 56px height (easily tappable)

### Native Ad Card
- [x] Native ad card displays below button
- [x] Icon with gradient background shows
- [x] "Ready to Trade?" title displays
- [x] Description text is readable
- [x] "Start Trading" button is styled correctly
- [x] Button shows snackbar on tap
- [x] "Sponsored" label appears at bottom
- [x] Card appears BEFORE "Your Assets" header

### Overall Layout
- [x] Vertical stack (button → ad card)
- [x] Proper spacing between elements
- [x] No layout issues on mobile/tablet
- [x] Responsive on all screen sizes
- [x] No warnings in diagnostics

## Design Details

### Colors
- **Start Learning Button:** AppColors.primary → withOpacity(0.8) gradient
- **Button Text:** Colors.white
- **Button Shadow:** AppColors.primary.withOpacity(0.3)
- **Native Ad Card:** Inherited from NativeAdCard widget
  - Border: AppColors.primary.withOpacity(0.2)
  - Background: Colors.grey.withOpacity(0.02)
  - Icon gradient: Primary color with opacity

### Spacing
- Button height: 56px (touch-friendly)
- Button width: double.infinity (full screen width)
- Gap between button and ad: paddingMedium (16px)
- All padding: paddingMedium (16px)

### Typography
- **Button Text:** fontSize: 16, fontWeight: w800, letterSpacing: 0.5
- **Ad Card:** Standard NativeAdCard typography
- **Balance:** fontWeight: w900, fontSize: 48

## Future Enhancements

- [ ] Add haptic feedback on button tap
- [ ] Animate button press with scale transform
- [ ] Add loading state for navigation
- [ ] Implement native ads in premium section
- [ ] Add analytics tracking for button clicks
- [ ] Support dark mode styling
- [ ] Add button icons with better visuals

## Related Changes

- Previous session: Native Ads Implementation
- Previous session: Practice Screen Redesign
- This session: Enhanced Total Balance card with animation

---

## Version
- **App:** v0.2.1
- **Features:** Wallet redesign with improved balance card and CTA buttons
- **Status:** Ready for testing
