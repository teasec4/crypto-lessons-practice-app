# Native Ad Implementation

## Overview

Native ads have been integrated into the lesson content experience at key user engagement points.

## Files Added

### `lib/features/lessons/presentation/widgets/native_ad_card.dart`

A reusable native ad card component with:
- **Left side**: Icon/image with gradient background (trending_up icon)
- **Right side**: 
  - Title (bold, 2 lines max)
  - Description (grey, 2 lines max)
  - "Learn More" / "Start Trading" button
- **Bottom**: "Sponsored" label in small grey text

**Properties:**
```dart
NativeAdCard(
  title: String,              // Ad title
  description: String,        // Ad description
  buttonText: String,         // Button text
  onTap: VoidCallback,        // Button click handler
  imageUrl: String? (optional) // Future image support
)
```

## Ad Placements

### 1. **On Last Lesson Page** (Content Screen)

**Location:** Before navigation buttons
**Trigger:** Only shown on page 10/10
**Layout:**
```
[Content of final page]
  ↓
[Native Ad Card]
  "Ready to Trade?"
  "Practice with real charts..."
  [Start Trading button]
  Sponsored ↓
  ↓
[Previous] [Complete]
```

**Purpose:** Engage user after spending time reading, direct to practice

### 2. **After Lesson Completion** (Dialog)

**Location:** In completion success dialog
**Layout:**
```
✅ Lesson Completed!
"Great job!"
  ↓
[Native Ad Card]
  "Start Real Trading Today"
  "Apply your knowledge..."
  [Learn More button]
  Sponsored ↓
  ↓
[Back to Lesson]
```

**Purpose:** Celebrate achievement + immediate offer while user is motivated

## Design Integration

### Visual Style
- Matches app's Material 3 design system
- Uses `AppColors.primary` for brand consistency
- Gradient backgrounds (subtle, 0.03-0.3 opacity)
- Rounded corners: `radiusMedium` (16-20px)
- Border: Primary color at 0.2 opacity

### Typography
- Title: `titleSmall`, bold (FontWeight.w700)
- Description: `bodySmall`, grey (Colors.grey[700])
- Button: White text, primary gradient
- Label: `labelSmall`, grey (11px), letter-spaced

### Spacing
- Padding: `paddingMedium` (16px)
- Icon/image: 80x80px
- Button height: 28px
- Gaps between elements: 4-8px

## Code Usage

### Simple Implementation

```dart
NativeAdCard(
  title: 'Ready to Trade?',
  description: 'Practice with real charts and market data on our trading platform.',
  buttonText: 'Start Trading',
  onTap: () {
    // Handle ad click
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Opening trading platform...')),
    );
  },
)
```

### In lesson_content_screen.dart

**On Last Page:**
```dart
if (currentPageIndex == totalPages - 1) ...[
  NativeAdCard(...),
  const SizedBox(height: AppConstants.paddingLarge),
],
```

**In Completion Dialog:**
```dart
NativeAdCard(
  title: 'Start Real Trading Today',
  description: 'Apply your knowledge with real crypto trading on our platform.',
  buttonText: 'Learn More',
  onTap: () { ... },
),
```

## Ad Content Examples

### Ad 1: "Ready to Trade?"
- **Title:** Ready to Trade?
- **Description:** Practice with real charts and market data on our trading platform.
- **Button:** Start Trading
- **Target:** After lesson completion

### Ad 2: "Start Real Trading Today"
- **Title:** Start Real Trading Today
- **Description:** Apply your knowledge with real crypto trading on our platform.
- **Button:** Learn More
- **Target:** Success dialog

## Future Enhancements

- [ ] Replace icon with actual ad images (`imageUrl` parameter)
- [ ] Add click tracking/analytics
- [ ] Rotate different ad creatives
- [ ] A/B test ad placement effectiveness
- [ ] Connect to real ad network (Google AdMob)
- [ ] Add native ad metrics (impressions, clicks)
- [ ] Conditional ad display based on user segment
- [ ] Ad refresh timer for different ads

## Analytics Integration Ready

The component is designed to easily track:

```dart
// Potential tracking events
- ad_impression
- ad_click
- ad_shown_on_page_X
- ad_ctr (click-through rate)
- time_to_click
- user_segment_X
```

## Responsive Design

The card adapts to all screen sizes:
- **Mobile (320px):** Full width with proper padding
- **Tablet (600px+):** Full width, better spacing
- **Icon/image:** Fixed 80x80px (scales proportionally with screen)

## Color Scheme

Uses existing app colors for consistency:
```dart
AppColors.primary          // Main brand color
AppColors.primary.withOpacity(0.3)   // For backgrounds
Colors.grey[700]           // For descriptions
Colors.white               // Button text
```

## Testing

To see the ads:

1. **Open Lessons Screen**
2. **Click any lesson → Start Lesson**
3. **Navigate to page 10/10** → See first ad card
4. **Click "Complete"** → See ad in success dialog
5. **Click ad buttons** → Shows snackbar "Opening trading platform..."

