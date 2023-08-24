import 'News.dart';

class NewsParentResponse {
  String? status;
  int totalResults = 0;
  List<dynamic> articles = List.empty();

  NewsParentResponse(
      {required this.status,
      required this.totalResults,
      required this.articles});

  NewsParentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles = json['articles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['articles'] = articles;
    return data;
  }
}
