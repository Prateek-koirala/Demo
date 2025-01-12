import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'core/network/api_client.dart';
import 'data/datasources/weather_remote_data_source.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/usecases/get_weather.dart';
import 'presentation/bloc/weather_bloc.dart';
import 'presentation/pages/weather_page.dart';

void main() {
  final apiClient = ApiClient(http.Client());
  final remoteDataSource = WeatherRemoteDataSourceImpl(apiClient);
  final repository = WeatherRepositoryImpl(remoteDataSource);
  final getWeather = GetWeather(repository);
  final weatherBloc = WeatherBloc(getWeather);

  runApp(MyApp(weatherBloc: weatherBloc));
}

class MyApp extends StatelessWidget {
  final WeatherBloc weatherBloc;

  const MyApp({super.key, required this.weatherBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherPage(weatherBloc: weatherBloc),
    );
  }
}
