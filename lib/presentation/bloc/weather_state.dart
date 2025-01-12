import '../../domain/entities/weather.dart';

//  WeatherState is a base class, and classes like WeatherLoading, WeatherLoaded, and WeatherError inherit from it.
//This allows these subclasses to be treated as WeatherState, enabling polymorphism while reusing common behavior.
//Abstraction
// he WeatherState is an abstract class, and its concrete implementations (such as WeatherLoading, WeatherLoaded,
//WeatherError) are hidden from the UI.
//The UI only interacts with the WeatherState abstraction, and it doesn't need to know the details of what each
//state represents
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
