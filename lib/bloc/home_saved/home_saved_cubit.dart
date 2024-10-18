import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/saved_news_service.dart';

part 'home_saved_state.dart';
part 'home_saved_cubit.freezed.dart';

class HomeSavedCubit extends Cubit<HomeSavedState> {
  HomeSavedCubit(this.savedNewsService) : super(const HomeSavedState.initial());
  final SavedNewsService savedNewsService;

  Future<void> getSavedNews() async {
    emit(const HomeSavedState.loading());
    final list = await savedNewsService.getSavedNews();
    emit(HomeSavedState.success(list));
  }
}
