import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/onboarding/onboarding_cubit.dart';
import 'package:news_app/utils/dependency.dart';
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      bloc: onboardingCubit,
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
            initialCubit.getInitialState();
          },
        );
      },
      child: Scaffold(
        body: PageView(
          controller: _controller,
          children: [
            OnboardingName(
              onSubmit: onboardingCubit.submitName,
            ),
            OnboardingCategories(
              onSubmit: onboardingCubit.submitCategories,
            ),
            OnboardingCity(
              onSubmit: onboardingCubit.submitCity,
            ),
          ],
        ),
      ),
    );
  }
}
