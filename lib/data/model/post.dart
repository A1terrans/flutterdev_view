class RedditPost {
  final String title;
  final String text;
  final String ups;
  String? thumbnail;

  RedditPost(
      {required this.title,
      required this.text,
      required this.ups,
      this.thumbnail});
}
