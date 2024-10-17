part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.success(Weather weather) = _Success;
  const factory WeatherState.failure() = _Failure;
  const factory WeatherState.noCity() = _NoCity;
}
