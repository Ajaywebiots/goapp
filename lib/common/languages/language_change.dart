import 'dart:convert';
import 'dart:developer';
import 'package:goapp/common/languages/language_helper.dart';
import 'package:goapp/config.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LanguageProvider with ChangeNotifier {
  String currentLanguage = '';
  Locale? locale;
  int selectedIndex = 0;
  final SharedPreferences sharedPreferences;
  LanguageProvider(this.sharedPreferences) {
    var selectedLocale = sharedPreferences.getString("selectedLocale");

    if (selectedLocale != null) {
      locale = Locale(selectedLocale);
    } else {
      selectedLocale = "english";
      locale = const Locale("en");
    }

    // getLanguage();
    // getLanguageTranslate();
  }


  LanguageHelper languageHelper = LanguageHelper();



  getLocal() {
    var selectedLocale = sharedPreferences.getString("selectedLocale");
    return selectedLocale;
  }

  //translateText api
  getLanguageTranslate() async {
  /*  try {
      translations = Translation.defaultTranslations();
      final response = await apiServices.getApi(
          "${api.translate}/${locale!.languageCode}", [],
          isToken: false, isData: true);

      if (response.isSuccess!) {
        translations =
            Translation.fromJson(response.data); // Directly pass the map
        log("Loaded translations: ${appFonts.skip}");
        notifyListeners();
      } else {
        log('Failed to load translations, using defaults');
        translations = Translation.defaultTranslations();
      }
    } catch (e) {
      log('Error Translation: $e');
      translations = Translation.defaultTranslations();
    } finally {
      notifyListeners();
    }*/
  }

  defineCurrentLanguage(context) {
    String? definedCurrentLanguage;
    if (currentLanguage.isNotEmpty) {
      log("definedCurrentLanguage:::$definedCurrentLanguage");
      definedCurrentLanguage = currentLanguage;
    } else {
      log("locale from currentData: ${Localizations.localeOf(context).toString()}");
      definedCurrentLanguage = languageHelper
          .convertLocaleToLangName(Localizations.localeOf(context).toString());
    }

    return definedCurrentLanguage;
  }



  setIndex(index) {
    selectedIndex = index;
    sharedPreferences.setInt("index", selectedIndex);
    log("selectedIndex::${selectedIndex}");
    notifyListeners();
  }
}
