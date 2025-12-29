class MediumPost {
  final String title;
  final String link;
  final String pubDate;
  final String author;
  final String description;
  final String? thumbnail;
  final List<String> categories;

  const MediumPost({
    required this.title,
    required this.link,
    required this.pubDate,
    required this.author,
    required this.description,
    this.thumbnail,
    required this.categories,
  });

  factory MediumPost.fromJson(Map<String, dynamic> json) {
    return MediumPost(
      title: json['title'] ?? '',
      link: json['link'] ?? '',
      pubDate: json['pubDate'] ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'],
      categories: List<String>.from(json['categories'] ?? []),
    );
  }
}
