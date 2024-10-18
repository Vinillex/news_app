import 'package:isar/isar.dart';
import 'package:news_app/model/news.dart';
import 'package:path_provider/path_provider.dart';

class SavedNewsService {
  Future<void> saveNews(News news) async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [NewsSchema],
      directory: dir.path,
    );
    await isar.writeTxn(() async {
      await isar.news.put(news);
    });

    await isar.close();
  }

  Future<void> removeNews(News news) async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [NewsSchema],
      directory: dir.path,
    );
    await isar.writeTxn(() async {
      await isar.news.deleteByTitle(news.title);
    });

    await isar.close();
  }

  Future<List<News>> getSavedNews() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [NewsSchema],
      directory: dir.path,
    );
    final list = await isar.news.where().findAll();
    await isar.close();
    return list;
  }

  Future<bool> isSaved(News news) async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [NewsSchema],
      directory: dir.path,
    );
    final list = await isar.news.buildQuery<News>(whereClauses: [
      IndexWhereClause.equalTo(indexName: 'title', value: [news.title]),
    ],).findAll();
    await isar.close();
    return list.isNotEmpty;
  }
}
