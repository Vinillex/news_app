part of 'home_favourite_cubit.dart';

@freezed
class HomeFavouriteState with _$HomeFavouriteState {
  const factory HomeFavouriteState.initial() = _Initial;
  const factory HomeFavouriteState.loading() = _Loading;
  const factory HomeFavouriteState.failure() = _Failure;
  const factory HomeFavouriteState.success(List<News> list) = _Success;
  const factory HomeFavouriteState.save() = _Save;
}
