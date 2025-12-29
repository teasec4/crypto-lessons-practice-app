class User {
  final String id;
  final String name;
  final String email;
  final String avatar; // placeholder URL
  final int lessonsCompleted;
  final int totalExp;
  final int level;
  final DateTime joinDate;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.lessonsCompleted,
    required this.totalExp,
    required this.level,
    required this.joinDate,
  });

  int get expToNextLevel => (level * 1000);
  double get progressToNextLevel => (totalExp % expToNextLevel) / expToNextLevel;
}
