part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.getSettings(
      String name, List<String> categories, String? city,) = _GetSettings;
}
