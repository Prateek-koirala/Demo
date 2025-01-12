// The WeatherRepository is an abstract class (or interface), and WeatherRepositoryImpl is one implementation.
//In the GetWeather use case, the code uses the WeatherRepository type, but the actual implementation could be different,
//such as WeatherRepositoryImpl or another class implementing WeatherRepository.
//This is polymorphism because the behavior varies based on which implementation of WeatherRepository is provided.
import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(String city);
}
