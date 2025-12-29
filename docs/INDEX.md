# Documentation Index

Central hub for all project documentation.

## 🎯 Quick Navigation

### New Here? Start With:
1. [../README.md](../README.md) — Project overview
2. [QUICK_START.md](QUICK_START.md) — How to run it
3. [../.development-workflow.md](../.development-workflow.md) — AI workflow guide

### Want to Code? Use This:
1. [../PROGRESS.md](../PROGRESS.md) — What's done/planned
2. [features/](features/) — Feature-specific details
3. [01_architecture.md](01_architecture.md) — Code patterns
4. [02_project_structure.md](02_project_structure.md) — File organization

### Need Reference?
- **How is code organized?** → [02_project_structure.md](02_project_structure.md)
- **How does navigation work?** → [routing.md](routing.md)
- **What's the design system?** → [UI_COMPONENTS.md](UI_COMPONENTS.md)
- **What's the vision?** → [00_vision.md](00_vision.md)
- **What's the roadmap?** → [03_roadmap.md](03_roadmap.md)

---

## 📚 Documentation By Category

### Core (Foundations)
| Document | Purpose |
|----------|---------|
| [../README.md](../README.md) | Project overview, features, tech stack |
| [../PROGRESS.md](../PROGRESS.md) | Current status, completed & planned features |
| [../CHANGELOG.md](../CHANGELOG.md) | Version history (read-only) |
| [../.development-workflow.md](../.development-workflow.md) | How to work with AI assistant |

### Architecture & Setup
| Document | Purpose |
|----------|---------|
| [QUICK_START.md](QUICK_START.md) | Development setup, how to run |
| [00_vision.md](00_vision.md) | Project goals and long-term vision |
| [01_architecture.md](01_architecture.md) | Technical architecture, design patterns |
| [02_project_structure.md](02_project_structure.md) | Folder structure, file organization |
| [03_roadmap.md](03_roadmap.md) | Future phases, milestones, timeline |

### Features (Detailed Guides)
| Document | Feature | Purpose |
|----------|---------|---------|
| [features/LESSONS.md](features/LESSONS.md) | Lessons | Educational system, progression, UI |
| [features/PRACTICE.md](features/PRACTICE.md) | Practice | Trading simulator, unlocking |
| [features/WALLET.md](features/WALLET.md) | Wallet | Crypto assets, balance, transactions |
| [features/PROFILE.md](features/PROFILE.md) | Profile | User stats, achievements, settings |
| [features/MONETIZATION.md](features/MONETIZATION.md) | Ads & Revenue | Native ads, premium features |

### Development
| Document | Purpose |
|----------|---------|
| [routing.md](routing.md) | Navigation structure, routes, deep linking |
| [UI_COMPONENTS.md](UI_COMPONENTS.md) | UI patterns, components, design system |
| [daily.md](daily.md) | Development log, session notes |

---

## 🎮 Use Cases

### Scenario 1: "I want to add a new feature"
1. Read [../PROGRESS.md](../PROGRESS.md) for current state
2. Read [features/](features/) for related features
3. Check [01_architecture.md](01_architecture.md) for patterns
4. Read [02_project_structure.md](02_project_structure.md) for file organization
5. Code & test

### Scenario 2: "I need to fix a bug"
1. Check [../PROGRESS.md](../PROGRESS.md) for context
2. Find relevant [features/](features/) doc
3. Look at code patterns in [01_architecture.md](01_architecture.md)
4. Fix bug
5. Test thoroughly

### Scenario 3: "I want to understand how Lessons work"
1. Read [features/LESSONS.md](features/LESSONS.md) — Feature overview
2. Check [02_project_structure.md](02_project_structure.md) — File locations
3. Review code in `lib/features/lessons/`
4. Check examples in [daily.md](daily.md)

### Scenario 4: "What's the overall architecture?"
1. Read [00_vision.md](00_vision.md) — Why this project exists
2. Read [01_architecture.md](01_architecture.md) — How code is organized
3. Read [02_project_structure.md](02_project_structure.md) — Where files are
4. Browse `lib/` folder

---

## 🚀 Quick Commands

```bash
# Run the app
flutter run

# Format code
dart format lib/

# Analyze code
dart analyze

# Run tests (when available)
flutter test
```

---

## 📊 Current Status

**Version:** v0.2.2  
**Phase:** MVP + UI Polish  
**Last Updated:** Session 4, 2025-12-29

### ✅ Completed
- Feature-based architecture
- 4-tab navigation (Lessons, Wallet, Practice, Profile)
- 9 lessons with progression system
- Virtual wallet with 5 cryptocurrencies
- Profile with achievements and settings
- Native ads on 4 screens
- Material 3 UI with light/dark themes

### 🔄 In Progress
- (None currently)

### ⏳ Planned (Phase 2)
- BLoC state management
- Drift SQLite database
- User authentication
- Real API integration
- Trading simulator logic

---

## 🔍 Features Overview

### Lessons
- 9 lessons (5 Beginner, 2 Intermediate, 2 Advanced)
- Progressive unlocking based on prerequisites
- Multi-page content with progress tracking
- Native ads on completion

**Details:** [features/LESSONS.md](features/LESSONS.md)

### Practice
- Trading simulator (locked until 5 lessons)
- Locked/unlocked UI states
- Clear progression messaging
- Native ads for premium upsell

**Details:** [features/PRACTICE.md](features/PRACTICE.md)

### Wallet
- 5 cryptocurrencies (USDT, BTC, ETH, XRP, SOL)
- Real-time balance calculation
- Asset list with 24h price changes
- Animated balance card

**Details:** [features/WALLET.md](features/WALLET.md)

### Profile
- User stats (Level, EXP, lessons completed)
- 6 achievements with unlock states
- Settings (notifications, security, general)
- Native ads between sections

**Details:** [features/PROFILE.md](features/PROFILE.md)

### Monetization
- Native ad cards on 4 screens
- Non-intrusive placement
- Transparent "Sponsored" labels
- Ready for Google AdMob integration

**Details:** [features/MONETIZATION.md](features/MONETIZATION.md)

---

## 📁 File Organization

### Root Level Documentation
```
README.md                    — Project overview
PROGRESS.md                  — Current status
CHANGELOG.md                 — Version history
.development-workflow.md     — AI workflow guide
```

### docs/ Folder
```
docs/
├── 00_vision.md            — Project vision
├── 01_architecture.md      — Technical architecture
├── 02_project_structure.md — File organization
├── 03_roadmap.md           — Future roadmap
├── QUICK_START.md          — Development setup
├── routing.md              — Navigation guide
├── UI_COMPONENTS.md        — Design system
├── daily.md                — Dev log
├── INDEX.md                — This file
└── features/               — Feature guides
    ├── LESSONS.md
    ├── PRACTICE.md
    ├── WALLET.md
    ├── PROFILE.md
    └── MONETIZATION.md
```

---

## 💡 Pro Tips

1. **Before editing code:** Check the relevant feature doc in [features/](features/)
2. **Lost in navigation?** Check [routing.md](routing.md)
3. **Need design reference?** Check [UI_COMPONENTS.md](UI_COMPONENTS.md)
4. **Want code examples?** Check [daily.md](daily.md) for session notes
5. **Not sure about status?** Check [../PROGRESS.md](../PROGRESS.md)

---

## 📞 How to Use This Documentation

### For AI Assistants:
1. Start with [../.development-workflow.md](../.development-workflow.md)
2. Check [../PROGRESS.md](../PROGRESS.md) for current state
3. Read relevant [features/](features/) doc before coding
4. Update [../PROGRESS.md](../PROGRESS.md) when done
5. Add session notes to [daily.md](daily.md)

### For Developers:
1. Start with [QUICK_START.md](QUICK_START.md)
2. Read [01_architecture.md](01_architecture.md) for patterns
3. Check [02_project_structure.md](02_project_structure.md) for file locations
4. Dive into relevant [features/](features/) doc
5. Reference [routing.md](routing.md) and [UI_COMPONENTS.md](UI_COMPONENTS.md) as needed

### For Project Managers:
1. Read [../README.md](../README.md) for overview
2. Check [../PROGRESS.md](../PROGRESS.md) for status
3. Review [03_roadmap.md](03_roadmap.md) for timeline
4. Check [../CHANGELOG.md](../CHANGELOG.md) for releases

---

Last Updated: Session 4, 2025-12-29
