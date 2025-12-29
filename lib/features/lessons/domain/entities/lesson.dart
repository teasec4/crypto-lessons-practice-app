class Lesson {
  final int id;
  final String title;
  final String description;
  final int duration; // в минутах
  final int difficulty; // 1-5
  final bool isCompleted;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.difficulty,
    this.isCompleted = false,
  });
}
