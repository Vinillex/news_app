import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home_favourite/home_favourite_cubit.dart';
import 'package:news_app/utils/dependency.dart';
import 'package:news_app/widget/custom_widget/news_card.dart';

class HomeFavourite extends StatefulWidget {
  const HomeFavourite({super.key});

  @override
  State<HomeFavourite> createState() => _HomeFavouriteState();
}

class _HomeFavouriteState extends State<HomeFavourite> {
  @override
  void initState() {
    homeFavouriteCubit.getFavouritesNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFavouriteCubit, HomeFavouriteState>(
      bloc: homeFavouriteCubit,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (values) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: values.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  news: values[index],
                  onSaveStatusChange: () {
                    
                  },
                  onSaved: () {
                    homeAllCubit.saveNews(values[index]);
                  },
                );
              },
            );
          },
          failure: () {
            return const Center(
              child: Text(
                'Oops!!! An error occured',
              ),
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
