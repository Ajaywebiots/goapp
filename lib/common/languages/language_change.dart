import 'dart:developer';

import '../../config.dart';
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
      setVal(selectedLocale);
      loadSelectedLanguage();
    } else {
      selectedLocale = "en";
      locale = const Locale("en");
      setVal(selectedLocale);
    }
  }

  Future<void> loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedIndex = prefs.getInt('selectedLanguageIndex') ?? 0;

    // Update currentLanguage based on selectedIndex
    if (selectedIndex < appArray.languageList.length) {
      String title = appArray.languageList[selectedIndex]["title"].toString();
      currentLanguage = title;
    }

    log("Selected Index: $selectedIndex, Language: $currentLanguage");
    notifyListeners();
  }


  LanguageHelper languageHelper = LanguageHelper();

  void changeLocale(String newLocale) {
    log("Changing Locale to: $newLocale");

    currentLanguage = newLocale;
    locale = languageHelper.convertLangNameToLocale(newLocale);
    log("Selected locale $locale");
    log("Selected locale!.languageCode ${locale!.languageCode}");
    sharedPreferences.setString('selectedLocale', locale!.languageCode);
    notifyListeners();
  }

  void setIndex(index) {
    selectedIndex = index;
    String languageTitle = appArray.languageList[selectedIndex]["title"].toString();

    // Save the language title
    sharedPreferences.setString('selectedLanguage', languageTitle);
    sharedPreferences.setInt('selectedLanguageIndex', index);

    changeLocale(languageTitle);
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

  Future<void> onRadioChange(int index, Map<String, dynamic> value) async {
    selectedIndex = index;

    String selectedLocale = value['locale'].toString();
    setVal(selectedLocale);
    locale = Locale(selectedLocale);
    sharedPreferences.setString('selectedLocale', selectedLocale);

    await sharedPreferences.setInt('selectedLanguageIndex', index);

    notifyListeners();
  }

  void setVal(String value) {
    if (value == "en") {
      currentLanguage = "English";
    } else if (value == "el") {
      currentLanguage = "Greek";
    }
    /* else if (value == "he") {
      currentLanguage = "Hebrew";
    } else if (value == "es") {
      currentLanguage = "Spanish";
    } else if (value == "ar") {
      currentLanguage = "Arabic";
    } else if (value == "ru") {
      currentLanguage = "Russian";
    }*/
    else {
      currentLanguage = "English";
    }
    notifyListeners();
  }
}
