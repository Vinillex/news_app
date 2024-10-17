import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/view/news_screen.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final void Function()? onSaveStatusChange;
  final void Function()? onSaved;
  const NewsCard(
      {super.key, this.onSaveStatusChange, this.onSaved, required this.news});

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
                if(onSaveStatusChange != null){
                  onSaveStatusChange.call();
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
