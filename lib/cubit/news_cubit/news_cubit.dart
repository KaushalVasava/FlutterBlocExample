import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/News.dart';
import '../../data/repo/NewsRepo.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super( NewsLoadingState() ) {
    fetchNews();
  }

  NewsRepo postRepo = NewsRepo();

  void fetchNews() async {
    try {
      List<News> news = await postRepo.fetchNews();
      emit(NewsLoadedState(news));
    }
    on DioException catch(ex) {
      if(ex.type == DioExceptionType.connectionError) {
        emit( NewsErrorState("Can't fetch posts, please check your internet connection!") );
      }
      else {
        emit( NewsErrorState(ex.type.toString()) );
      }
    }
  }
}
