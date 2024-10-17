import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/services/location_service.dart';
import 'package:news_app/utils/api_calls.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState.initial());

  Future<void> getLocation() async {
    emit(const LocationState.loading());
    try {
      final locationService =
          ChopperUtils().chopper.getService<LocationService>();
      final city = await locationService.getLocation();
      emit(LocationState.success(city.body!['city'] as String));
    } catch (e) {
      emit(const LocationState.failure());
    }
  }
}
