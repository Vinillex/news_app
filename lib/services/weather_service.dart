import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:news_app/utils/url_constants.dart';

part 'weather_service.chopper.dart';

@ChopperApi(baseUrl: UrlConstants.weatherBaseUrl)
abstract class WeatherService extends ChopperService {
  static WeatherService create(ChopperClient client) =>
      _$WeatherService(client);


  @Get(path: UrlConstants.weatherPath)
  Future<Response<Map<String, dynamic>>> getWeather(
    @Query() String q,
  );
}
