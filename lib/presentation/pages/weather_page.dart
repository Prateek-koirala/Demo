import 'package:demo/domain/entities/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';

class WeatherPage extends StatelessWidget {
  final WeatherBloc weatherBloc;

  const WeatherPage({super.key, required this.weatherBloc});

  @override
  Widget build(BuildContext context) {
    final cityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        builder: (context, state) {
          if (state is WeatherInitial) {
            return buildInitialInput(cityController, context);
          } else if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return buildWeatherDisplay(state.weather);
          } else if (state is WeatherError) {
            return Center(child: Text(state.message));
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget buildInitialInput(
      TextEditingController controller, BuildContext context) {
    return Column(
      children: [
        TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'City')),
        ElevatedButton(
          onPressed: () {
            weatherBloc.add(FetchWeatherEvent(controller.text));
          },
          child: Text('Get Weather'),
        ),
      ],
    );
  }

  Widget buildWeatherDisplay(Weather weather) {
    return Center(
      child: Text(
          '${weather.city}: ${weather.temperature}°C, ${weather.description}'),
    );
  }
}
