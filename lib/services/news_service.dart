import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:news_app/utils/url_constants.dart';

part 'news_service.chopper.dart';

@ChopperApi(baseUrl: UrlConstants.newsBaseUrl)
abstract class NewsService extends ChopperService {
  static NewsService create(ChopperClient client) => _$NewsService(client);

  @Get(path: UrlConstants.newsEverythingPath)
  Future<Response<Map<String, dynamic>>> getAllNews();

  @Get(path: UrlConstants.newFavouritePath)
  Future<Response<Map<String, dynamic>>> getFavourites(
    @Query() String category,
  );
}
