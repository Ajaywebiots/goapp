import '../config.dart';

class ApiClass {
  String baseUrl = "https://go-1-api.azurewebsites.net/api";

  static Map<String, String>? headersToken(token) => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
        "Accept-Lang": "en",
      };

  static Map<String, String>? get headers =>
      {'Accept': 'application/json', 'Content-Type': 'application/json'};
}
