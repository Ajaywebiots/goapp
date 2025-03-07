import '../config.dart';

class ApiClass {
  String baseUrl = "https://go-1-api.azurewebsites.net/api";

  static Map<String, String>? headersToken(token) => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
        "X-GoApp-Api-Key": "ba16106c-2d7b-4a13-bdb2-b15b19691280"
      };

  static Map<String, String>? get headers => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        "X-GoApp-Api-Key": "ba16106c-2d7b-4a13-bdb2-b15b19691280"
      };
}
