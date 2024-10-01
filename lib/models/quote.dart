class Quote {
  final String content;
  final String author;

  Quote({required this.content, required this.author});

  // Parsing JSON menjadi object Quote
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['q'], // ZenQuotes API menggunakan 'q' untuk content
      author: json['a'],  // ZenQuotes API menggunakan 'a' untuk author
    );
  }
}
