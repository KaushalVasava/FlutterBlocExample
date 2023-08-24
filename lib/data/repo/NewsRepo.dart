import 'package:dio/dio.dart';
import 'package:fluttor_app/data/api/NewsApi.dart';
import 'package:fluttor_app/data/model/News.dart';
import 'package:fluttor_app/data/model/NewsParentResponse.dart';

class NewsRepo {
  NewsApi api = NewsApi();

  Future<List<News>> fetchNews() async {
    try {
      Response response = await api.sendRequest.get("/general/in.json");
      dynamic newsParentResponse = response.data;
      List<dynamic> newsMaps =
          NewsParentResponse.fromJson(newsParentResponse).articles.toList();
      return newsMaps.map((newsMap) => News.fromJson(newsMap)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
