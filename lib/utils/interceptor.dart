import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:news_app/utils/configurations.dart';
import 'package:news_app/utils/url_constants.dart';

class ApiKeyInterceptor implements Interceptor {
  ApiKeyInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    var request = chain.request;

    if (chain.request.uri.origin == UrlConstants.newsBaseUrl) {
      request = chain.request.copyWith(
        parameters: {
          'apiKey': Configurations.newsApiKey,
          'q': 'a',
        },
      );
    }
    if (chain.request.uri.origin == UrlConstants.weatherBaseUrl) {
      final parameters =
          Map<String, dynamic>.from(chain.request.parameters)
              .map(MapEntry<String, dynamic>.new);
      parameters['key'] = Configurations.weatherApiKey;
      request = chain.request.copyWith(
        parameters: parameters,
      );
    }

    return chain.proceed(request);
  }
}
