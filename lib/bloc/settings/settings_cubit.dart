import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/services/onboarding_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final OnboardingService onboardingService;
  SettingsCubit(this.onboardingService) : super(SettingsState.initial());

  Future<void> getSettings() async {
    final name = await onboardingService.getName();
    final categories = await onboardingService.getCategories();
    final city = await onboardingService.getCity();
    emit(SettingsState.getSettings(name!, categories!, city));
  }

  Future<void> setName(String name) async {
    await onboardingService.setName(name);
  }

  Future<void> setCategories(List<String> categories) async {
    await onboardingService.setCategories(categories);
  }

  Future<void> setCity(String city) async {
    await onboardingService.setCity(city);
  }
}
