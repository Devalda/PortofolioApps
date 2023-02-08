class Blog {
  final String quoteText;
  final String author;

  const Blog({
    required this.quoteText,
    required this.author,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      quoteText: json['q'],
      // id: json['id'],
      author: json['a'],
    );
  }
}
