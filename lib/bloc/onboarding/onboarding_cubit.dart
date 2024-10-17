import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/utils/dependency.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState.initial());


  void submitName(String name) {
    onboardingService.setName(name);
    emit(const OnboardingState.submitName());
  }

  void submitCategories(List<String> categories) {
    onboardingService.setCategories(categories);
    emit(const OnboardingState.submitCategories());
  }

  void submitCity(String? city) {
    if (city != null) {
      onboardingService.setCity(city);
    }
    emit(const OnboardingState.submitCity());
  }
}
