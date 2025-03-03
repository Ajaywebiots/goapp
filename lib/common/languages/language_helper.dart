import 'package:flutter/material.dart';

class LanguageHelper {
  convertLangNameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert.toLowerCase()) {
      case "english":
        convertedLocale = const Locale('en', 'US');
        break;
      case "greek":
        convertedLocale = const Locale('el', 'GR');
        break;
      case "hebrew":
        convertedLocale = const Locale('he', 'IL');
        break;
      default:
        convertedLocale = const Locale('en', 'US');
    }

    return convertedLocale;
  }

  convertLocaleToLangName(String localeToConvert) {
    String langName;
    switch (localeToConvert) {
      case 'en':
        langName = "English";
        break;
      case 'el':
        langName = "Greek";
        break;
      case 'he':
        langName = "Hebrew";
        break;
      default:
        langName = "English";
    }
    return langName;
  }
}
