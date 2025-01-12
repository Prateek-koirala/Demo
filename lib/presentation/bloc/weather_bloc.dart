import 'package:bloc/bloc.dart';

import '../../domain/usecases/get_weather.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;

  // Constructor now only takes 'getWeather' as the required positional argument
  WeatherBloc(this.getWeather) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        // Fetch weather using the 'getWeather' use case
        final weather = await getWeather(event.city);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError('Could not fetch weather'));
      }
    });
  }
}
