import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/weather/weather_cubit.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late WeatherCubit _weatherCubit;

  @override
  void initState() {
    _weatherCubit = GetIt.I<WeatherCubit>();
    _weatherCubit.getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      bloc: _weatherCubit,
      builder: (context, state) {
        return state.maybeWhen(
          success: (weather) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      weather.current?.tempC != null
                          ? '${weather.current!.tempC}°C'
                          : '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      weather.current?.windKph != null
                          ? '${weather.current?.windKph} kph'
                          : '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  weather.current?.condition?.text != null
                      ? '${weather.current!.condition?.text}'
                      : '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
