import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsgen/news/models/news_model.dart';
import '../repo/news_repository.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;
  NewsBloc(this._newsRepository) : super(NewsLoadingState()) {
    on<NewsEvent>(
      (event, emit) async {
        emit(NewsLoadingState());
        try {
          var news = await _newsRepository.getNews();
          emit(
            NewsLoadedState(news),
          );
        } catch (e) {
          emit(
            NewsErrorState(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
