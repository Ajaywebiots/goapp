import 'dart:developer';
import '../config.dart';

class ApiClass {
  String baseUrl = "https://go-1-api.azurewebsites.net/api";

  static Future<Map<String, String>> headersToken(token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String locale = pref.getString("selectedLocale") ?? "en";
    if (locale == "el") {
      locale = "el";
    }
    log("ajaaaaaa aaaa aaa $locale");
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
      "X-GoApp-Api-Key": "ba16106c-2d7b-4a13-bdb2-b15b19691280",
      "Accept-Language": locale
    };
  }

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String locale = pref.getString("selectedLocale") ?? "en";
    if (locale == "el") {
      locale = "el";
    }

    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "X-GoApp-Api-Key": "ba16106c-2d7b-4a13-bdb2-b15b19691280",
      "Accept-Language": locale
    };
  }
}
