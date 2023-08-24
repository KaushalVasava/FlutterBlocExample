import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NewsApi {

  final Dio _dio = Dio();
  final String baseUrl =  "https://saurav.tech/NewsAPI/top-headlines/category";
  NewsApi() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}