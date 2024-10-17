import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/utils/api_calls.dart';
import 'package:news_app/utils/dependency.dart';

part 'home_all_state.dart';
part 'home_all_cubit.freezed.dart';

class HomeAllCubit extends Cubit<HomeAllState> {
  HomeAllCubit() : super(const HomeAllState.initial());

  Future<void> getAllNews() async {
    emit(const HomeAllState.loading());
    try {
      final newsService = ChopperUtils().chopper.getService<NewsService>();
      final response = await newsService.getAllNews();
      final articles = response.body?['articles'] as List<dynamic>;
      final list = List<News>.from(
        articles.map(
          (e) => News.fromJson(e as Map<String, dynamic>),
        ),
      ).where((e) => e.title != '[Removed]').toList();
      emit(HomeAllState.success(list));
    } catch (e) {
      emit(const HomeAllState.failure());
    }
  }

  Future<void> saveNews(News news) async {
    await savedNewsService.saveNews(news);
  }
}
