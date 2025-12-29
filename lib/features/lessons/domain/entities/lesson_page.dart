class LessonPage {
  final int pageNumber;
  final String title;
  final String content;
  final String? imageUrl;

  const LessonPage({
    required this.pageNumber,
    required this.title,
    required this.content,
    this.imageUrl,
  });
}
