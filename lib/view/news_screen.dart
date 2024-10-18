import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/widget/custom_widget/save_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({required this.news, super.key});
  final News news;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String publishedDate() {
    final publishedDateTime = DateTime.parse(widget.news.publishedAt!);
    final formatter = DateFormat('dd MMMM, yyyy');
    return formatter.format(publishedDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                  ),
                ),
              ),
              Text(
                widget.news.title ?? '',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text(publishedDate()),
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      await Share.share(
                        widget.news.url ?? '',
                        subject: 'Hey! Check out this news',
                      );
                    },
                    icon: const Icon(Icons.share),
                  ),
                  SaveButton(
                    news: widget.news,
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              AspectRatio(
                aspectRatio: 3 / 2,
                child: CachedNetworkImage(
                  imageUrl: widget.news.urlToImage!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Text('Cannot display image'),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.news.description ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                child: IconButton(
                  onPressed: () async {
                    final url = Uri.parse(widget.news.url!);
                    await launchUrl(
                      url,
                      mode: LaunchMode.inAppWebView,
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_sharp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
