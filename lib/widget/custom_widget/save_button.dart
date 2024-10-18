import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/news/news_cubit.dart';
import 'package:news_app/model/news.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({required this.news, super.key});
  final News news;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  late NewsCubit _newsCubit;

  @override
  void initState() {
    _newsCubit = GetIt.I<NewsCubit>();
    _newsCubit.getSaveStatus(widget.news);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      bloc: _newsCubit,
      builder: (context, state) {
        return state.maybeWhen(
          isSaved: (isSaved) {
            return IconButton(
              onPressed: () async {
                await _newsCubit.toggleStatus(widget.news);
              },
              icon: Icon(
                Icons.save,
                color: isSaved ? Colors.purple : Colors.black,
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
