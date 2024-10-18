import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/initial_cubit/initial_cubit.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/onboarding_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late InitialCubit _initialCubit;

  @override
  void initState() {
    _initialCubit = GetIt.I<InitialCubit>();
    _initialCubit.getInitialState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialCubit, InitialState>(
      bloc: _initialCubit,
      builder: (context, state) {
        return state.maybeWhen(
          initial: () {
            return const Scaffold();
          },
          onboarding: () {
            return const OnboardingScreen();
          },
          onboarded: () {
            return const HomeScreen();
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
