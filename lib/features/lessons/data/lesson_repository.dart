import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson.dart';
import 'package:crypto_trading_lessons/features/lessons/domain/entities/lesson_page.dart';

class LessonRepository {
  static final List<Map<String, dynamic>> _lessonsData = [
    // Beginner lessons
    {
      'id': 1,
      'title': 'Crypto Basics',
      'description': 'Learn the fundamentals of cryptocurrency.',
      'duration': 15,
      'difficulty': 1,
      'category': LessonCategory.beginner,
    },
    {
      'id': 2,
      'title': 'Blockchain Explained',
      'description': 'Understanding blockchain technology.',
      'duration': 20,
      'difficulty': 2,
      'category': LessonCategory.beginner,
    },
    {
      'id': 3,
      'title': 'Wallets & Security',
      'description': 'Secure your cryptocurrency assets.',
      'duration': 18,
      'difficulty': 2,
      'category': LessonCategory.beginner,
    },
    {
      'id': 4,
      'title': 'First Trade',
      'description': 'Make your first cryptocurrency trade.',
      'duration': 25,
      'difficulty': 2,
      'category': LessonCategory.beginner,
    },
    {
      'id': 5,
      'title': 'Risk Management',
      'description': 'Learn to manage trading risks.',
      'duration': 20,
      'difficulty': 3,
      'category': LessonCategory.beginner,
    },
    // Intermediate lessons
    {
      'id': 6,
      'title': 'Technical Analysis',
      'description': 'Master chart analysis and indicators.',
      'duration': 30,
      'difficulty': 3,
      'category': LessonCategory.intermediate,
    },
    {
      'id': 7,
      'title': 'Trading Strategies',
      'description': 'Learn profitable trading strategies.',
      'duration': 35,
      'difficulty': 3,
      'category': LessonCategory.intermediate,
    },
    // Advanced lessons
    {
      'id': 8,
      'title': 'Advanced Charts',
      'description': 'Complex analysis techniques.',
      'duration': 40,
      'difficulty': 4,
      'category': LessonCategory.advanced,
    },
    {
      'id': 9,
      'title': 'Automated Trading',
      'description': 'Bot trading and automation.',
      'duration': 45,
      'difficulty': 5,
      'category': LessonCategory.advanced,
    },
  ];

  static Lesson getLessonById(int id) {
    final data = _lessonsData.firstWhere(
      (lesson) => lesson['id'] == id,
      orElse: () => _lessonsData[0],
    );

    return Lesson(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      duration: data['duration'],
      difficulty: data['difficulty'],
      category: data['category'],
      isCompleted: id < 4, // Mock - первые 3 урока завершены
    );
  }

  static List<Lesson> getAllLessons() {
    return _lessonsData.map((data) {
      return Lesson(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        duration: data['duration'],
        difficulty: data['difficulty'],
        category: data['category'],
        isCompleted: data['id'] < 4,
      );
    }).toList();
  }

  /// Получить ID текущего (следующего для прохождения) урока
  static int getCurrentLessonId() {
    // Mock: первые 3 урока завершены (isCompleted при id < 4)
    // значит текущий урок это 4й
    return 4;
  }

  /// Получить страницы контента для урока (10 страниц)
  static List<LessonPage> getLessonPages(int lessonId) {
    final lesson = getLessonById(lessonId);

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
