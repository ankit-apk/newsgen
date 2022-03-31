import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsgen/news/repo/news_repository.dart';
import 'package:newsgen/news/screens/news_detail.dart';
import 'package:sizer/sizer.dart';
import '../bloc/news_bloc.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsBloc(RepositoryProvider.of<NewsRepository>(context))
            ..add(
              LoadNewsEvent(),
            ),
      child: Scaffold(
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoadingState) {
              return const LoadingScreen();
            }
            if (state is NewsLoadedState) {
              return ListView.builder(
                itemCount: state.newsModel.articles!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetail(
                              newsModel: state.newsModel, index: index),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 40.h,
                      width: 90.w,
                      child: Column(
                        children: [
                          Image.network(
                            state.newsModel.articles![index].urlToImage
                                .toString(),
                            fit: BoxFit.fill,
                            height: 30.h,
                            width: 90.w,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            state.newsModel.articles![index].title.toString(),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is NewsErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
