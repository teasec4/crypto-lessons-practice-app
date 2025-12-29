# UI Components & Design System

## Overview

This document describes the UI components, design patterns, and visual system used throughout the app.

## Design Principles

1. **Gamification** - Use levels, progress, and visual rewards to motivate users
2. **Visual Hierarchy** - Use size, color, and shadows to guide attention
3. **Accessibility** - Clear labels, sufficient contrast, readable typography
4. **Consistency** - Reusable components, unified spacing, cohesive color scheme

## Color System

### Primary Color
- **Usage**: Main actions, active states, primary text
- **Hex**: Defined in `app_colors.dart` as `AppColors.primary`
- **Components**: "Start" button, completed lesson indicator, progress bar

### Secondary Colors
- **Success** (Green): Achievements, completed items, checkmarks
- **Warning** (Orange): Alerts, locked states, caution messages
- **Error** (Red): Difficult lessons, critical information
- **Info** (Blue): Information messages, secondary data

## Components Library

### 1. Lesson Tile (`lesson_tile.dart`)

**States:**

#### Completed State ✅
- Green checkmark icon
- Full color gradient (primary color)
- Title and content in black
- No button interaction

#### Current Lesson 🔵
- Bright "Start" button with:
  - Blue gradient (primary → primary 0.75)
  - Double shadow effect for depth
  - w900 font weight
  - 0.8 letter spacing
  - Padding: 16x9
- Full color appearance
- Clear visual emphasis

#### Locked Lesson 🔒
- Grey "Locked" button with:
  - Grey background (Colors.grey[400])
  - Lock icon (12px)
  - Disabled appearance
  - Padding: 12x6
- Greyed text
- Reduced opacity (tiles only)

**Visual Features:**
- Gradient background (blue for completed, grey for incomplete)
- Double box shadow for depth
- Smooth transitions
- Touch feedback with InkWell

### 2. Lessons Screen

**Components:**

#### Progress Section
- Level indicator with emoji: 📱 Newbie → 📈 Trader → 🚀 Advanced → 👑 Master → ⭐ Legend
- Progress bar with blue color
- Completion counter (e.g., "3/9 lessons")
- Level calculated from completed lesson count:
  - 0 lessons = Newbie
  - 1-2 lessons = Trader
  - 3-5 lessons = Advanced
  - 6-7 lessons = Master
  - 8+ lessons = Legend

#### Category Headers
- Lock icon for locked categories
- Lesson count badge
- Expand/collapse arrow
- Tap to expand/collapse

#### Expandable Sections
- Smooth expand/collapse animation
- Shows lessons when expanded
- Prevents expansion if locked

### 3. Practice Screen

**Locked State Components:**

#### Visual Lockdown
- Large lock icon (🔒) in orange circle
- Heading: "Practice Locked"
- Warning message box (orange styling):
  - Text: "You must complete all Beginner lessons before unlocking Practice"
  - Clear, non-negotiable message

#### Progress Information
- "Progress to Unlock" card with:
  - Progress bar (blue)
  - Counter badge (primary color)
  - Emoji indicator (✨)
  - Remaining lessons counter

#### Call-to-Action
- "Go to Lessons" button with:
  - Blue gradient
  - School icon (🎓)
  - Double shadow
  - w800 font weight
  - Direct link to `/lessons`

#### Motivational Section
- "Why complete lessons first?" heading
- Bullet list with reasons
- Check circle icons (green)

**Unlocked State Components:**

#### Hero Section
- "Trading Simulator" title
- Gradient card with blue styling
- "Ready to Trade" subheading (with 🚀 emoji)

#### Feature List
- Check circle icons (green)
- Feature descriptions
- Organized in column layout

#### Start Button
- Full-width action button
- Blue gradient
- w800 font weight
- 56px height for good touch target

## Typography

### Heading Styles
- **Headline Small**: Page titles (font-size: 22)
- **Title Medium**: Section headers (font-size: 16, w600-w700)
- **Body Large**: Primary text (font-size: 16)
- **Body Medium**: Secondary text (font-size: 14)
- **Body Small**: Tertiary text (font-size: 12)

### Font Weights Used
- **w700**: Titles, bold text
- **w800**: Emphasis, buttons
- **w900**: Strong emphasis, "Start" button
- **w600**: Secondary text
- **w500**: Tertiary text

## Spacing System

Defined in `app_constants.dart`:

- **paddingSmall**: 8px (gaps, icons)
- **paddingMedium**: 16px (standard spacing)
- **paddingLarge**: 24px (sections, margins)

## Shadows & Depth

### Single Shadow (Subtle)
```dart
BoxShadow(
  color: Colors.withOpacity(0.1),
  blurRadius: 4,
)
```

### Double Shadow (Depth)
```dart
BoxShadow(
  color: Colors.withOpacity(0.5),
  blurRadius: 12,
  offset: Offset(0, 3),
),
BoxShadow(
  color: Colors.withOpacity(0.25),
  blurRadius: 24,
  offset: Offset(0, 6),
),
```

## Gradients

### Primary Gradient (Blue)
```dart
LinearGradient(
  colors: [
    AppColors.primary,
    AppColors.primary.withOpacity(0.75),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

### Subtle Gradient (Backgrounds)
```dart
LinearGradient(
  colors: [
    color.withOpacity(0.05),
    color.withOpacity(0.02),
  ],
)
```

## Interactive Elements

### Buttons

#### Primary Action Button
- Gradient background
- Double shadow
- Bold text (w800-w900)
- 56px height
- Full width option

#### Secondary Button
- Solid color background
- Single shadow
- Medium text (w700)
- Smaller padding

#### Icon Button
- No background
- InkWell for feedback
- 24-48px size depending on context

### Cards

#### Featured Card
- Gradient background
- Border with opacity
- Box shadow
- Padding inside
- Rounded corners (radiusMedium)

#### Data Card
- Subtle background color
- Light border
- Compact padding
- Used for counters, badges

## Animations

### Transitions
- **InkWell**: Splash effect on tap
- **AnimatedScale**: Icon scaling on state change
- **Duration**: 200-300ms for smooth feel

### No-Transition Navigation
- GoRouter with no slide/fade effects
- Instant screen replacement for tabs
- Preserves app state

## Accessibility

### Color Contrast
- Minimum 4.5:1 ratio for text
- Use both color and icons for status indication
- Avoid red-only indicators

### Touch Targets
- Minimum 48x48dp for interactive elements
- Buttons: 56px height
- Icons: 24px minimum
- Sufficient spacing between touch targets

### Typography
- Readable font sizes (12px minimum)
- Good contrast between text and background
- Clear, bold fonts for important information

## Common Patterns

### Loading States
- Not implemented yet (BLoC planned)
- Will use shimmer/skeleton when added

### Empty States
- Not implemented yet
- Planned for future release

### Error States
- Warning color (orange) for alerts
- Clear messaging
- Action buttons to resolve

## Implementation Tips

1. **Use AppConstants** for all spacing values
2. **Use AppColors** for all color references
3. **Use Theme** for typography
4. **Test gradients** on both light and dark themes
5. **Consider shadows** in dark mode (might need adjustment)

## Future Improvements

- [ ] Add animations for list items
- [ ] Implement proper loading states
- [ ] Add error boundary components
- [ ] Create reusable button component library
- [ ] Add theme transition animations
- [ ] Improve dark mode shadow visibility

---

**Last Updated:** 2025-12-29
**Version:** v0.1.1
