import 'package:flutter/material.dart';

class LanguageHelper {
  Locale convertLangNameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert.toLowerCase()) {
      case "english":
        convertedLocale = const Locale('en', 'US');
        break;
      case "greek":
        convertedLocale = const Locale('el', 'GR');
        break;
      /* case "hebrew":
        convertedLocale = const Locale('he', 'IL');
        break;
      case "spanish":
        convertedLocale = const Locale('es', 'ES');
        break;
      case "arabic":
        convertedLocale = const Locale('ar', 'SA');
        break;
      case "russian":
        convertedLocale = const Locale('ru', 'RU');
        break;*/
      default:
        convertedLocale = const Locale('en', 'US');
    }
    return convertedLocale;
  }

  String convertLocaleToLangName(String localeToConvert) {
    String langName;

    switch (localeToConvert) {
      case 'en':
        langName = "English";
        break;
      case 'el':
        langName = "Greek";
        break;
      /*case 'he':
        langName = "Hebrew";
        break;
      case 'es':
        langName = "Spanish";
        break;
      case 'ar':
        langName = "Arabic";
        break;
      case 'ru':
        langName = "Russian";
        break;*/
      default:
        langName = "English";
    }

    return langName;
  }
}
