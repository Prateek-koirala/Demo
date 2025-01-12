//The Weather class encapsulates the data related to weather information (such as temperature, description, and city).
//The data is hidden from external access and is only accessible via getter methods or constructors.

class Weather {
  final String city;
  final double temperature;
  final String description;

  Weather({
    required this.city,
    required this.temperature,
    required this.description,
  });
}
