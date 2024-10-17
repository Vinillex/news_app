import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/utils/dependency.dart';

part 'initial_state.dart';
part 'initial_cubit.freezed.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit() : super(const InitialState.initial());

  Future<void> getInitialState() async {
    if (await onboardingService.isOnboarded()) {
      emit(const InitialState.onboarded());
    } else {
      emit(const InitialState.onboarding());
    }
  }
}
