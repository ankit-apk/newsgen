part of 'news_bloc.dart';

@immutable
abstract class NewsState {
  const NewsState();
}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final NewsModel newsModel;
  const NewsLoadedState(this.newsModel);

  List<Object?> get props => [newsModel];
}

class NewsErrorState extends NewsState {
  final String error;
  const NewsErrorState(this.error);
  List<Object?> get props => [error];
}
