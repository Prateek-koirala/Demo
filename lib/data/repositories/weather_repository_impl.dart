// The WeatherRepositoryImpl encapsulates the details of how weather data is fetched, e.g., via the WeatherRemoteDataSource.
// External code does not need to know the details of how the data is retrieved
//(via a remote API, local database, etc.), only that the getWeather() method will return the required data.

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Weather> getWeather(String city) async {
    return remoteDataSource.fetchWeather(city);
  }
}
