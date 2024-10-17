import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/home/home_cubit.dart';
import 'package:news_app/bloc/home_all/home_all_cubit.dart';
import 'package:news_app/bloc/home_favourite/home_favourite_cubit.dart';
import 'package:news_app/bloc/home_saved/home_saved_cubit.dart';
import 'package:news_app/bloc/initial_cubit/initial_cubit.dart';
import 'package:news_app/bloc/location/location_cubit.dart';
import 'package:news_app/bloc/onboarding/onboarding_cubit.dart';
import 'package:news_app/bloc/weather/weather_cubit.dart';
import 'package:news_app/services/onboarding_service.dart';
import 'package:news_app/services/saved_news_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerFactory<SavedNewsService>(SavedNewsService.new)
    ..registerFactory<OnboardingService>(OnboardingService.new)
    ..registerFactory<LocationCubit>(LocationCubit.new)
    ..registerSingleton<InitialCubit>(InitialCubit())
    ..registerFactory<OnboardingCubit>(OnboardingCubit.new)
    ..registerFactory<HomeAllCubit>(HomeAllCubit.new)
    ..registerFactory<HomeFavouriteCubit>(HomeFavouriteCubit.new)
    ..registerFactory<HomeSavedCubit>(HomeSavedCubit.new)
    ..registerFactory<HomeCubit>(HomeCubit.new)
    ..registerFactory<WeatherCubit>(WeatherCubit.new);
}

final onboardingService = GetIt.instance<OnboardingService>();
final savedNewsService = GetIt.instance<SavedNewsService>();

final initialCubit = GetIt.instance<InitialCubit>();
final locationCubit = GetIt.instance<LocationCubit>();
final onboardingCubit = GetIt.instance<OnboardingCubit>();
final homeAllCubit = GetIt.instance<HomeAllCubit>();
final homeFavouriteCubit = GetIt.instance<HomeFavouriteCubit>();
final homeSavedCubit = GetIt.instance<HomeSavedCubit>();
final homeCubit = GetIt.instance<HomeCubit>();
final weatherCubit = GetIt.instance<WeatherCubit>();
