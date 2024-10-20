import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/services/onboarding_service.dart';
import 'package:news_app/services/saved_news_service.dart';
import 'package:news_app/utils/api_calls.dart';

part 'home_favourite_state.dart';
part 'home_favourite_cubit.freezed.dart';

class HomeFavouriteCubit extends Cubit<HomeFavouriteState> {
  HomeFavouriteCubit(this.onboardingService, this.savedNewsService)
      : super(const HomeFavouriteState.initial());
  final OnboardingService onboardingService;
  final SavedNewsService savedNewsService;

  Future<void> getFavouritesNews() async {
    emit(const HomeFavouriteState.loading());
    try {
      final newsService = ChopperUtils().chopper.getService<NewsService>();
      final categories = await onboardingService.getCategories();

      final futures = List<Future<Response<Map<String, dynamic>>>>.generate(
          categories!.length, (index) {
        return newsService.getFavourites(categories[index]);
      });

      final responses = await Future.wait([...futures]);

      final list = <News>[];

      for (final response in responses) {
        final articles = response.body?['articles'] as List<dynamic>;
        list.addAll(
          List<News>.from(
            articles.map(
              (e) => News.fromJson(e as Map<String, dynamic>),
            ),
          ).where((e) => e.title != '[Removed]').toList(),
        );
      }

      emit(HomeFavouriteState.success(list));
    } catch (e) {
      emit(const HomeFavouriteState.failure());
    }
  }

  Future<void> saveNews(News news) async {
    await savedNewsService.saveNews(news);
  }
}
