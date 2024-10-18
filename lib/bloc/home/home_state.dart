part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.noInternetState(String greetings) = _NoInternetState;
  const factory HomeState.internetAvailable(String greetings) = _InternetAvailableState;
  const factory HomeState.loading() = _Loading;
}
