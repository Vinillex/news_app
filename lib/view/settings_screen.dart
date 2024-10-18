import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/settings/settings_cubit.dart';
import 'package:news_app/widget/custom_widget/categories_card.dart';
import 'package:news_app/widget/custom_widget/city_card.dart';
import 'package:news_app/widget/custom_widget/name_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsCubit _settingsCubit = GetIt.I<SettingsCubit>();

  @override
  void initState() {
    _settingsCubit.getSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      bloc: _settingsCubit,
      builder: (context, state) {
        return state.maybeWhen(getSettings: (name, categories, city) {
          return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Column(
                  children: [
                    NameCard(
                      name: name,
                      onSubmit: _settingsCubit.setName,
                    ),
                    CategoriesCard(
                      selectedCategories: categories,
                      onSubmit: _settingsCubit.setCategories,
                    ),
                    CityCard(
                      onSubmit: _settingsCubit.setCity,
                      city: city,
                    ),
                  ],
                ),
              ],
            ),
          );
        }, orElse: () {
          return const SizedBox.shrink();
        },);
      },
    );
  }
}
