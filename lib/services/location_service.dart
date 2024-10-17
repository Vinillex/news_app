// import 'package:news_app/utils/api_calls.dart';
// import 'package:news_app/utils/url_constants.dart';

// class LocationService {

//   Future<String> getLocationMagic() async {
//     final response = await ChopperUtils().get(UrlConstants.locationBaseUrl);
//     final city = response.body['city'] as String;
//     return city;
//   }

// }

import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:news_app/utils/url_constants.dart';

part 'location_service.chopper.dart';

@ChopperApi(baseUrl: UrlConstants.locationBaseUrl)
abstract class LocationService extends ChopperService {
  static LocationService create(ChopperClient client) => _$LocationService(client);

  @Get(path: UrlConstants.locationPath)
  Future<Response<Map<String,dynamic>>> getLocation(
  );
}
