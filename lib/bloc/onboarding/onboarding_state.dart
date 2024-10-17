part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _Initial;
  const factory OnboardingState.submitName() = _SubmitName;
  const factory OnboardingState.submitCategories() =
      _SubmitCategories;
  const factory OnboardingState.submitCity() = _SubmitCity;
}
