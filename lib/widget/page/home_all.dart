import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/home_all/home_all_cubit.dart';
import 'package:news_app/widget/custom_widget/news_card.dart';

class HomeAll extends StatefulWidget {
  const HomeAll({super.key});

  @override
  State<HomeAll> createState() => _HomeAllState();
}

class _HomeAllState extends State<HomeAll> {
  late HomeAllCubit _homeAllCubit;
  @override
  void initState() {
    _homeAllCubit = GetIt.I<HomeAllCubit>();
    _homeAllCubit.getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeAllCubit, HomeAllState>(
      bloc: _homeAllCubit,
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
                    _homeAllCubit.saveNews(values[index]);
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
