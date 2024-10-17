part of 'initial_cubit.dart';

@freezed
class InitialState with _$InitialState {
  const factory InitialState.initial() = _Initial;
  const factory InitialState.onboarding() = _Onboarding;
  const factory InitialState.onboarded() = _Onboarded;
}
