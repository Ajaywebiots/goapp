import 'dart:developer';

import '../config.dart';

// URLs
String apiUrl = "";
String paymentUrl = "";


String playstoreUrl =
    "https://play.google.com/store/apps/details?id=com.pixelstrap.fixit_provider_api";

late SharedPreferences sharedPreferences;
// String local = appSettingModel!.general!.defaultLanguage!.locale!;

// Initialize SharedPreferences and Locale
Future<void> initializeAppSettings() async {
  sharedPreferences = await SharedPreferences.getInstance();
  // local = sharedPreferences.getString('selectedLocale').toString();
  // log("set language:: $local");
}

// Headers Token Function
Map<String, String>? headersToken(String? token) => {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // "Accept-Lang": local,
      "Authorization": "Bearer $token",
    };

// Default Headers
Map<String, String>? get headers => {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // "Accept-Lang": local,
    };
