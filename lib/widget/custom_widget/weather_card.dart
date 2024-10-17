import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/weather/weather_cubit.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // return BlocBuilder<WeatherCubit,WeatherState>(
    //   bloc: WeatherCubit()
    //   builder: (context,state){
    //     return 
    // });
  }
}
