import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home_saved/home_saved_cubit.dart';
import 'package:news_app/utils/dependency.dart';
import 'package:news_app/widget/custom_widget/news_card.dart';

class HomeSaved extends StatefulWidget {
  const HomeSaved({super.key});

  @override
  State<HomeSaved> createState() => _HomeSavedState();
}

class _HomeSavedState extends State<HomeSaved> {
  @override
  void initState() {
    homeSavedCubit.getSavedNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSavedCubit, HomeSavedState>(
      bloc: homeSavedCubit,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (values) {
            if (values.isEmpty) {
              return const Center(
                child: Text(
                  'You have not saved any news',
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: values.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  news: values[index],
                  onSaveStatusChange: () {
                    
                  },
                );
              },
            );
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
