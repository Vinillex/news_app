import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/initial_cubit/initial_cubit.dart';
import 'package:news_app/utils/dependency.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/onboarding_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    initialCubit.getInitialState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialCubit, InitialState>(
      bloc: initialCubit,
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
