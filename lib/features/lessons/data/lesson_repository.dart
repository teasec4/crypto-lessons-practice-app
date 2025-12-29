import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson.dart';
import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson_page.dart';
import 'package:crypto_trading_lessons/core/data/app_content.dart';

class LessonRepository {
  /// Get all lessons from centralized AppContent
  static List<Lesson> getAllLessons() {
    return AppContent.getAllLessons();
  }

  /// Get single lesson by ID from centralized AppContent
  static Lesson getLessonById(int id) {
    final lesson = AppContent.getLessonById(id);
    if (lesson == null) {
      throw Exception('Lesson $id not found');
    }
    return lesson;
  }

  /// Get current lesson ID from centralized AppContent
  static int getCurrentLessonId() {
    return AppContent.getCurrentLessonId();
  }

  /// Get lesson pages/content (10 pages per lesson)
  /// Future: Move to app_content.dart when fully designed
  static List<LessonPage> getLessonPages(int lessonId) {
    final lesson = getLessonById(lessonId);

    // Lesson content pages - organized by lesson ID
    final pagesContent = {
      1: [
        'Introduction to Cryptocurrency',
        'What is Bitcoin?',
        'How Cryptocurrency Works',
        'Decentralization Benefits',
        'Cryptocurrency vs Traditional Money',
        'Getting Started with Crypto',
        'Key Terms You Need to Know',
        'Security Fundamentals',
        'Common Mistakes to Avoid',
        'Next Steps in Your Journey',
      ],
      2: [
        'What is Blockchain?',
        'How Blocks Are Created',
        'The Chain Structure',
        'Consensus Mechanisms',
        'Proof of Work Explained',
        'Proof of Stake Overview',
        'Smart Contracts Basics',
        'Real-World Applications',
        'Blockchain Limitations',
        'The Future of Blockchain',
      ],
      3: [
        'Types of Crypto Wallets',
        'Hardware Wallets Security',
        'Software Wallets Overview',
        'Private Keys vs Public Keys',
        'Seed Phrases Importance',
        'Backup Strategies',
        'Common Security Threats',
        'Best Practices for Safety',
        'Recovery Methods',
        'Staying Secure Online',
      ],
      4: [
        'Choosing a Trading Platform',
        'KYC Process Overview',
        'Setting Up Your Account',
        'Types of Orders',
        'Market vs Limit Orders',
        'Reading the Order Book',
        'Your First Trade Step-by-Step',
        'Transaction Fees Explained',
        'Common Trading Mistakes',
        'After Your First Trade',
      ],
      5: [
        'Understanding Risk',
        'Position Sizing Basics',
        'Stop Loss Orders',
        'Take Profit Levels',
        'Risk-Reward Ratio',
        'Portfolio Diversification',
        'Emotional Trading Control',
        'Money Management Rules',
        'Avoiding FOMO',
        'Long-term Risk Planning',
      ],
      6: [
        'Candlestick Charts Explained',
        'Chart Patterns Overview',
        'Support and Resistance',
        'Trend Lines Analysis',
        'Moving Averages',
        'RSI Indicator',
        'MACD Indicator',
        'Volume Analysis',
        'Combining Indicators',
        'Practice Your Analysis',
      ],
      7: [
        'Scalping Strategies',
        'Day Trading Basics',
        'Swing Trading Explained',
        'Trend Following Strategy',
        'Mean Reversion Strategy',
        'Breakout Trading',
        'Range Trading',
        'Strategy Backtesting',
        'Risk Management in Strategies',
        'Creating Your Own Strategy',
      ],
      8: [
        'Advanced Chart Patterns',
        'Divergences Explained',
        'Multi-Timeframe Analysis',
        'Order Flow Analysis',
        'Volume Profile Trading',
        'Market Structure',
        'Institutional Trading',
        'Advanced Indicators',
        'Combining Multiple Methods',
        'Becoming an Expert',
      ],
      9: [
        'Introduction to Trading Bots',
        'How Bots Work',
        'Grid Trading Bots',
        'DCA Bots Explained',
        'Backtesting Your Bot',
        'Setting Bot Parameters',
        'Risk in Bot Trading',
        'Popular Bot Platforms',
        'Monitoring Your Bot',
        'Mastering Automation',
      ],
    };

    final titles = pagesContent[lessonId] ?? pagesContent[1]!;

    return List.generate(
      10,
      (index) => LessonPage(
        pageNumber: index + 1,
        title: titles[index],
        content: _generateContent(lesson.title, titles[index]),
      ),
    );
  }

  /// Generate lesson page content
  /// TODO: Future - move to centralized content storage
  static String _generateContent(String lessonTitle, String pageTitle) {
    return '''
$pageTitle

This is the content for "$pageTitle" from the lesson "$lessonTitle". 

In a real application, this would contain detailed information, educational material, and resources to help you learn about cryptocurrency trading.

Key points to remember:
• Take your time to understand each concept
• Review previous pages if something is unclear
• Practice what you learn in the trading simulator
• Ask questions in the community forum

Use the Next button to continue learning.
''';
  }
}
