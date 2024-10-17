// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

class Weather {
  Weather({
    this.location,
    this.current,
  });

  factory Weather.fromRawJson(String str) =>
      Weather.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
      );
  final Location? location;
  final Current? current;

  Weather copyWith({
    Location? location,
    Current? current,
  }) =>
      Weather(
        location: location ?? this.location,
        current: current ?? this.current,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
      };
}

class Current {
  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.airQuality,
  });

  factory Current.fromRawJson(String str) =>
      Current.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json['last_updated_epoch'] as int?,
        lastUpdated: json['last_updated'] as String?,
        tempC: json['temp_c']?.toDouble() as double?,
        tempF: json['temp_f']?.toDouble() as double?,
        isDay: json['is_day'] as int?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windMph: json['wind_mph']?.toDouble() as double?,
        windKph: json['wind_kph']?.toDouble() as double?,
        windDegree: json['wind_degree'] as int?,
        windDir: json['wind_dir'] as String?,
        pressureMb: json['pressure_mb'] as double?,
        pressureIn: json['pressure_in']?.toDouble() as double?,
        precipMm: json['precip_mm'] as double?,
        precipIn: json['precip_in'] as double?,
        humidity: json['humidity'] as int?,
        cloud: json['cloud'] as int?,
        feelslikeC: json['feelslike_c'] as double?,
        feelslikeF: json['feelslike_f']?.toDouble() as double?,
        visKm: json['vis_km'] as double?,
        visMiles: json['vis_miles'] as double?,
        uv: json['uv'] as double?,
        gustMph: json['gust_mph']?.toDouble() as double?,
        gustKph: json['gust_kph']?.toDouble() as double?,
        airQuality: (json['air_quality'] != null)
            ? AirQuality.fromJson(json['air_quality'] as Map<String, dynamic>)
            : null,
      );
  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? visKm;
  final double? visMiles;
  final double? uv;
  final double? gustMph;
  final double? gustKph;
  final AirQuality? airQuality;

  Current copyWith({
    int? lastUpdatedEpoch,
    String? lastUpdated,
    double? tempC,
    double? tempF,
    int? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    double? pressureMb,
    double? pressureIn,
    double? precipMm,
    double? precipIn,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? visKm,
    double? visMiles,
    double? uv,
    double? gustMph,
    double? gustKph,
    AirQuality? airQuality,
  }) =>
      Current(
        lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        tempC: tempC ?? this.tempC,
        tempF: tempF ?? this.tempF,
        isDay: isDay ?? this.isDay,
        condition: condition ?? this.condition,
        windMph: windMph ?? this.windMph,
        windKph: windKph ?? this.windKph,
        windDegree: windDegree ?? this.windDegree,
        windDir: windDir ?? this.windDir,
        pressureMb: pressureMb ?? this.pressureMb,
        pressureIn: pressureIn ?? this.pressureIn,
        precipMm: precipMm ?? this.precipMm,
        precipIn: precipIn ?? this.precipIn,
        humidity: humidity ?? this.humidity,
        cloud: cloud ?? this.cloud,
        feelslikeC: feelslikeC ?? this.feelslikeC,
        feelslikeF: feelslikeF ?? this.feelslikeF,
        visKm: visKm ?? this.visKm,
        visMiles: visMiles ?? this.visMiles,
        uv: uv ?? this.uv,
        gustMph: gustMph ?? this.gustMph,
        gustKph: gustKph ?? this.gustKph,
        airQuality: airQuality ?? this.airQuality,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition?.toJson(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
        'air_quality': airQuality?.toJson(),
      };
}

class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromRawJson(String str) =>
      Condition.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
        code: json['code'] as int?,
      );
  final String? text;
  final String? icon;
  final int? code;

  Condition copyWith({
    String? text,
    String? icon,
    int? code,
  }) =>
      Condition(
        text: text ?? this.text,
        icon: icon ?? this.icon,
        code: code ?? this.code,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };
}

class Location {

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });
  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'] as String?,
        region: json['region'] as String?,
        country: json['country'] as String?,
        lat: json['lat']?.toDouble() as double?,
        lon: json['lon']?.toDouble() as double?,
        tzId: json['tz_id'] as String?,
        localtimeEpoch: json['localtime_epoch'] as int?,
        localtime: json['localtime'] as String?,
      );
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  Location copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    int? localtimeEpoch,
    String? localtime,
  }) =>
      Location(
        name: name ?? this.name,
        region: region ?? this.region,
        country: country ?? this.country,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        tzId: tzId ?? this.tzId,
        localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
        localtime: localtime ?? this.localtime,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'tz_id': tzId,
        'localtime_epoch': localtimeEpoch,
        'localtime': localtime,
      };
}

class AirQuality {

  AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usepaindex,
    this.gbdefraindex,
  });

  factory AirQuality.fromRawJson(String str) =>
      AirQuality.fromJson(json.decode(str) as Map<String, dynamic>);

  factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
        co: json['co']?.toDouble() as double?,
        no2: json['no2']?.toDouble() as double?,
        o3: json['o3']?.toDouble() as double?,
        so2: json['so2'] as int?,
        pm25: json['pm2_5']?.toDouble() as double?,
        pm10: json['pm10'] as int?,
        usepaindex: json['us-epa-index'] as int?,
        gbdefraindex: json['gb-defra-index'] as int?,
      );
  final double? co;
  final double? no2;
  final double? o3;
  final int? so2;
  final double? pm25;
  final int? pm10;
  final int? usepaindex;
  final int? gbdefraindex;

  AirQuality copyWith({
    double? co,
    double? no2,
    double? o3,
    int? so2,
    double? pm25,
    int? pm10,
    int? usepaindex,
    int? gbdefraindex,
  }) =>
      AirQuality(
        co: co ?? this.co,
        no2: no2 ?? this.no2,
        o3: o3 ?? this.o3,
        so2: so2 ?? this.so2,
        pm25: pm25 ?? this.pm25,
        pm10: pm10 ?? this.pm10,
        usepaindex: usepaindex ?? this.usepaindex,
        gbdefraindex: gbdefraindex ?? this.gbdefraindex,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'co': co,
        'no2': no2,
        'o3': o3,
        'so2': so2,
        'pm2_5': pm25,
        'pm10': pm10,
        'us-epa-index': usepaindex,
        'gb-defra-index': gbdefraindex,
      };
}
