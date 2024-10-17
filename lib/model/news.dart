import 'package:isar/isar.dart';

part 'news.g.dart';

@collection
class News {

  News({
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] as String?,
      );
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value,unique: true,replace: true)
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
}
