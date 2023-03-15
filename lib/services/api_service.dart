import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/geocode/json';
  static const String _apiKey = 'your_api_key_here';

  Future<Map<String, dynamic>> getLocationData(double lat, double lng) async {
    final url = '$_baseUrl?latlng=$lat,$lng&key=$_apiKey';

    final response = await http.get(Uri.parse(url));
    final responseJson = json.decode(response.body);

    return responseJson;
  }
}