import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttor_app/cubit/news_cubit/news_cubit.dart';
import 'package:fluttor_app/cubit/news_cubit/news_state.dart';
import '../data/model/News.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Home"),
        ),
        body: SafeArea(
            child: Center(
          //blockBuilder used for UI operation
          //blockListener used for background task like do so calculation, navigation etc
          //blockConsumer used for Both task UI and background
          child: BlocConsumer<NewsCubit, NewsState>(
            listener: (context, state) {
              if (state is NewsErrorState) {
                SnackBar snackBar = SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              // else if (state == InternetState.lost) {
              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //     content: Text("Not Connected"),
              //     backgroundColor: Colors.red,
              //   ));
              // }
            },
            builder: (context, state) {
              if (state is NewsLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is NewsLoadedState) {
                return buildNewsListView(
                    state.news.where((e) => e.urlToImage != null).toList());
              }

              return Center(
                child: Text("An error occured!"),
              );
            },
          ),
        )));
  }

  Widget buildNewsListView(List<News> newsData) {
    return ListView.builder(
      itemCount: newsData.length,
      itemBuilder: (context, index) {
        News news = newsData[index];

        return ListTile(
          title: CachedNetworkImage(
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()) ,
              imageUrl: news.urlToImage!),
          subtitle: Text(news.description.toString()),
        );
      },
    );
  }
}
