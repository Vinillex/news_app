import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/home_favourite/home_favourite_cubit.dart';
import 'package:news_app/widget/custom_widget/news_card.dart';

class HomeFavourite extends StatefulWidget {
  const HomeFavourite({super.key});

  @override
  State<HomeFavourite> createState() => _HomeFavouriteState();
}

class _HomeFavouriteState extends State<HomeFavourite> {
  late HomeFavouriteCubit _homeFavouriteCubit;

  @override
  void initState() {
    _homeFavouriteCubit = GetIt.I<HomeFavouriteCubit>();
    _homeFavouriteCubit.getFavouritesNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeFavouriteCubit, HomeFavouriteState>(
      bloc: _homeFavouriteCubit,
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
                  onSaveStatusChange: () {},
                  onSaved: () {
                    _homeFavouriteCubit.saveNews(values[index]);
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
