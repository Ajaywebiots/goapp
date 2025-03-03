import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_helper.dart';

class LanguageProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;

  bool get isUserRTl => sharedPreferences.getBool("isUserRTL") ?? false;

  TextDirection get data => isUserRTl ? TextDirection.rtl : TextDirection.ltr;

  Future<void> switchRTL() async {
    sharedPreferences.setBool("isUserRTL", !isUserRTl);
    notifyListeners();
  }

  TextDirection get textDirection =>
      isUserRTl ? TextDirection.rtl : TextDirection.ltr;
  String currentLanguage = "English";

  Locale? locale;
  int selectedIndex = 0;

  LanguageProvider(this.sharedPreferences) {
    var selectedLocale = sharedPreferences.getString("selectedLocale");
    log("Selected Locale: $selectedLocale");

    if (selectedLocale != null) {
      locale = Locale(selectedLocale);
    } else {
      selectedLocale = "en";
      locale = const Locale("en");
    }
    setVal(selectedLocale);
  }

  LanguageHelper languageHelper = LanguageHelper();

  void changeLocale(String newLocale) {
    log("Changing Locale to: $newLocale");

    currentLanguage = newLocale;
    locale = languageHelper.convertLangNameToLocale(newLocale);
    sharedPreferences.setString('selectedLocale', locale!.languageCode);
    notifyListeners();
  }

  String? getLocal() {
    return sharedPreferences.getString("selectedLocale");
  }

  String defineCurrentLanguage(BuildContext context) {
    return currentLanguage.isNotEmpty
        ? currentLanguage
        : languageHelper.convertLocaleToLangName(
            Localizations.localeOf(context).languageCode);
  }

  void setVal(String value) {
    if (value == "en") {
      currentLanguage = "English";
    } else if (value == "el") {
      currentLanguage = "Greek";
    } else if (value == "he") {
      currentLanguage = "Hebrew";
    } else {
      currentLanguage = "English";
    }
    notifyListeners();
  }
}
