import '../../core/usecases/usecase.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeather implements UseCase<Weather, String> {
  final WeatherRepository repository;

  GetWeather(this.repository);

  @override
  Future<Weather> call(String city) async {
    return repository.getWeather(city);
  }
}
