import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/utils/dependency.dart';
import 'package:news_app/utils/extension/datetime_extension.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  Future<void> getHomeState() async {
    final name = await onboardingService.getName();
    final greetings = '${DateTime.now().getGreetingMessage()}, ${name!}';
    final result = await InternetConnection().hasInternetAccess;
    if (result) {
      emit(HomeState.internetAvailable(greetings));
    } else {
      emit(HomeState.noInternetState(greetings));
    }
  }
}
