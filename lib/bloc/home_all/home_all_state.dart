part of 'home_all_cubit.dart';

@freezed
class HomeAllState with _$HomeAllState {
  const factory HomeAllState.initial() = _Initial;
  const factory HomeAllState.loading() = _Loading;
  const factory HomeAllState.failure() = _Failure;
  const factory HomeAllState.success(List<News> news) = _Success;
  const factory HomeAllState.save() = _Save;
}
