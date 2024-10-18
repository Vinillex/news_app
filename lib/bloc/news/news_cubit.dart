import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/saved_news_service.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.savedNewsService) : super(const NewsState.initial());
  final SavedNewsService savedNewsService;

  Future<void> getSaveStatus(News news) async {
    final isSaved = await savedNewsService.isSaved(news);
    emit(NewsState.isSaved(isSaved));
  }

  Future<void> toggleStatus(News news) async {
    final isSaved = await savedNewsService.isSaved(news);
    if (isSaved) {
      await savedNewsService.removeNews(news);
      emit(const NewsState.isSaved(false));
    } else {
      await savedNewsService.saveNews(news);
      emit(const NewsState.isSaved(true));
    }
  }
}
