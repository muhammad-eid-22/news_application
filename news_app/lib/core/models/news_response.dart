class NewsApiResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;
  NewsApiResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) {
    return NewsApiResponse(
      status: json["status"] ?? "",
      totalResults: json["totalResults"] ?? 0,
      articles: json["articles"] == null
          ? []
          : List<Article>.from(
              json["articles"]!.map((x) => Article.fromJson(x)),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": articles.map((x) => x?.toJson()).toList(),
  };
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final Source? source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime? publishedAt;
  final String content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json["source"] == null ? null : Source.fromJson(json["source"]),
      author: json["author"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ?? "",
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
      content: json["content"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "source": source?.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt?.toIso8601String(),
    "content": content,
  };
}

class Source {
  final String id;
  final String name;
  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json["id"] ?? "", name: json["name"] ?? "");
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
