import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home_all/home_all_cubit.dart';
import 'package:news_app/utils/dependency.dart';

class HomeAll extends StatefulWidget {
  const HomeAll({super.key});

  @override
  State<HomeAll> createState() => _HomeAllState();
}

class _HomeAllState extends State<HomeAll> {
  @override
  void initState() {
    homeAllCubit.getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeAllCubit, HomeAllState>(
      bloc: homeAllCubit,
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
                return Card(
                  child: ListTile(
                    title: Text(values[index].title ?? ''),
                    trailing: IconButton(
                      onPressed: () {
                        homeAllCubit.saveNews(values[index]);
                      },
                      icon: const Icon(
                        Icons.save,
                      ),
                    ),
                  ),
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
