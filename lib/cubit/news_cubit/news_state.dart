import '../../data/model/News.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<News> news;
  NewsLoadedState(this.news);
}

class NewsErrorState extends NewsState {
  final String error;
  NewsErrorState(this.error);
}