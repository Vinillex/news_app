import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/services/onboarding_service.dart';

part 'initial_state.dart';
part 'initial_cubit.freezed.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit(this.onboardingService) : super(const InitialState.initial());
  final OnboardingService onboardingService;

  Future<void> getInitialState() async {
    if (await onboardingService.isOnboarded()) {
      emit(const InitialState.onboarded());
    } else {
      emit(const InitialState.onboarding());
    }
  }
}
