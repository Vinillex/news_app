import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/initial_cubit/initial_cubit.dart';
import 'package:news_app/bloc/onboarding/onboarding_cubit.dart';
import 'package:news_app/widget/page/onboarding_categories.dart';
import 'package:news_app/widget/page/onboarding_city.dart';
import 'package:news_app/widget/page/onboarding_name.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  final OnboardingCubit _onboardingCubit = GetIt.I<OnboardingCubit>();
  final InitialCubit _initialCubit = GetIt.I<InitialCubit>();

  @override
  void dispose() {
    // _onboardingCubit = GetIt.I<OnboardingCubit>();
    // _initialCubit = GetIt.I<InitialCubit>();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      bloc: _onboardingCubit,
      listener: (context, state) {
        state.when(
          initial: () {},
          submitName: () {
            _controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          },
          submitCategories: () {
            _controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          },
          submitCity: () {
            _initialCubit.getInitialState();
          },
        );
      },
      child: Scaffold(
        body: PageView(
          controller: _controller,
          children: [
            OnboardingName(
              onSubmit: _onboardingCubit.submitName,
            ),
            OnboardingCategories(
              onSubmit: _onboardingCubit.submitCategories,
            ),
            OnboardingCity(
              onSubmit: _onboardingCubit.submitCity,
            ),
          ],
        ),
      ),
    );
  }
}
