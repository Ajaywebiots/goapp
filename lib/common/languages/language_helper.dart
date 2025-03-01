import 'package:flutter/material.dart';

class LanguageHelper {
  convertLangNameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert) {
      case "english":
        convertedLocale = const Locale('en', 'EN');
        break;
      case "greek":
        convertedLocale = const Locale('gr', 'GR');
        break;
      case 'hebrew':
        convertedLocale = const Locale('he', 'HE');
        break;

      default:
        convertedLocale = const Locale('en', 'EN');
    }

    return convertedLocale;
  }

  convertLocaleToLangName(String localeToConvert) {
    String langName;
    switch (localeToConvert) {
      case 'en':
        langName = "English";
        break;
      case 'gr':
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
