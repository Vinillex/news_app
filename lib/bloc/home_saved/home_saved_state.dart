part of 'home_saved_cubit.dart';

@freezed
class HomeSavedState with _$HomeSavedState {
  const factory HomeSavedState.initial() = _Initial;
  const factory HomeSavedState.loading() = _Loading;
  const factory HomeSavedState.success(List<News> news) = _Success;
}
