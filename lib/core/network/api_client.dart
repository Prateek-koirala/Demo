import 'package:demo/core/error/exception.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;

  ApiClient(this.client);

  Future<String> get(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException();
    }
  }
}
