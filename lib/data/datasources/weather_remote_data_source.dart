import 'dart:convert';

import '../../core/network/api_client.dart';
import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> fetchWeather(String city);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient apiClient;

  WeatherRemoteDataSourceImpl(this.apiClient);

  @override
  Future<WeatherModel> fetchWeather(String city) async {
    final response = await apiClient.get(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=aed91d7d9ed8eaeab8b80e46f8d9277d',
    );
    return WeatherModel.fromJson(json.decode(response));
  }
}
