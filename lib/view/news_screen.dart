import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';

class NewsScreen extends StatefulWidget {
  final News news;
  const NewsScreen({super.key, required this.news});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            widget.news.urlToImage!
          ),
        ],
      ),
    );
  }
}
