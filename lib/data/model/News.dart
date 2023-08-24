// class News{
//   String? description;
//   String? title;
//   String? url;
//   String? urlToImage;
//
//   News({required this.description, required this.title, required this.url, required this.urlToImage});
//
//   News.fromJson(Map<String, dynamic> json) {
//     description = json['description'];
//     title = json['title'];
//     url = json['url'];
//     urlToImage = json['urlToImage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['description'] = description;
//     data['title'] = title;
//     data['url'] = url;
//     data['urlToImage'] = urlToImage;
//     return data;
//   }
// }

class News {
  News({
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
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['description'] = description;
  //   data['title'] = title;
  //   data['url'] = url;
  //   data['urlToImage'] = urlToImage;
  //   return data;
  // }

  factory News.fromJson(Map<String, dynamic> json){
    return News(
      source: json["source"] == null ? null : Source.fromJson(json["source"]),
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
      content: json["content"],
    );
  }
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  final dynamic id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json){
    return Source(
      id: json["id"],
      name: json["name"],
    );
  }
}
