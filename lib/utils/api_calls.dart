import 'package:chopper/chopper.dart';
import 'package:news_app/services/location_service.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/services/weather_service.dart';
import 'package:news_app/utils/interceptor.dart';

class ChopperUtils {
  factory ChopperUtils() {
    return _instance;
  }

  ChopperUtils._internal() {
    chopper = ChopperClient(
      services: [
        LocationService.create(ChopperClient()),
        NewsService.create(ChopperClient()),
        WeatherService.create(ChopperClient()),
      ],
      interceptors: [
        ApiKeyInterceptor(),
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
    );
  }

  static final ChopperUtils _instance = ChopperUtils._internal();

  late ChopperClient chopper;
}
