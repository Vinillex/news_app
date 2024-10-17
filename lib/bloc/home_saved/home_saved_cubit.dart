import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/utils/dependency.dart';

part 'home_saved_state.dart';
part 'home_saved_cubit.freezed.dart';

class HomeSavedCubit extends Cubit<HomeSavedState> {
  HomeSavedCubit() : super(const HomeSavedState.initial());

  Future<void> getSavedNews() async {
    emit(const HomeSavedState.loading());
    final list = await savedNewsService.getSavedNews();
    emit(HomeSavedState.success(list));
  }
}
