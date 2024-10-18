import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/view/news_screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {required this.news, super.key, this.onSaveStatusChange, this.onSaved,});
  final News news;
  final void Function()? onSaveStatusChange;
  final void Function()? onSaved;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => NewsScreen(
                news: news,
              ),
            ),
          )
              .then((value) {
            if (onSaveStatusChange != null) {
              onSaveStatusChange!();
            }
          });
        },
        title: Text(news.title ?? ''),
        trailing: onSaved != null
            ? IconButton(
                onPressed: onSaved,
                icon: const Icon(
                  Icons.save,
                ),
              )
            : null,
      ),
    );
  }
}
