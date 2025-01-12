import 'package:demo/domain/repositories/weather_repository.dart'; // Import the Repository interface
import 'package:demo/domain/usecases/get_weather.dart'; // Import GetWeather use case
import 'package:demo/main.dart'; // Adjust this import if necessary
import 'package:demo/presentation/bloc/weather_bloc.dart'; // Import WeatherBloc
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc package
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart'; // For mocking

// Create a mock class for WeatherRepository
class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  testWidgets('Weather Page test', (WidgetTester tester) async {
    // Create a mock WeatherRepository
    final mockWeatherRepository = MockWeatherRepository();

    // Create the GetWeather use case by passing the mockWeatherRepository
    final getWeather = GetWeather(mockWeatherRepository);

    // Create an instance of WeatherBloc by passing GetWeather to it
    final weatherBloc = WeatherBloc(getWeather);

    // Build the widget by providing the weatherBloc through BlocProvider
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>(
          create: (context) => weatherBloc,
          child: MyApp(weatherBloc: weatherBloc),
        ),
      ),
    );

    // Verify that the widget is rendered and the app works as expected.
    expect(find.text('Weather App'), findsOneWidget);

    // Additional checks, like ensuring the text field and button are rendered
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
