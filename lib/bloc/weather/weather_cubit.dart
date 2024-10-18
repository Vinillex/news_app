import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/model/weather.dart';
import 'package:news_app/services/onboarding_service.dart';
import 'package:news_app/services/weather_service.dart';
import 'package:news_app/utils/api_calls.dart';

part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.onboardingService) : super(const WeatherState.initial());
  final OnboardingService onboardingService;

  Future<void> getWeatherData() async {
    emit(const WeatherState.loading());
    final city = await onboardingService.getCity();
    if (city != null) {
      try {
        final weatherService =
            ChopperUtils().chopper.getService<WeatherService>();
        final response = await weatherService.getWeather(city);
        final weather = Weather.fromJson(response.body!);
        emit(WeatherState.success(weather));
      } catch (e) {
        emit(const WeatherState.failure());
      }
    } else {
      emit(const WeatherState.noCity());
    }
  }
}
