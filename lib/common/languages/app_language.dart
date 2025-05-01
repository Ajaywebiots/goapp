import 'package:flutter/material.dart';
import 'package:goapp/common/languages/gr.dart';

import 'en.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationDelagate();

  static AppLocalizations? of(context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  Future<bool> load() async {
    return true;
  }

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': english,
    'el': greek,
    // 'he': hebrew,
    // 'es': spanish,
    // 'ar': arabic,
    // 'ru': russian,
  };
}

class AppLocalizationDelagate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelagate();

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'el', /*'he', 'es', 'ar', 'ru'*/
    ].contains(locale.languageCode);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
    return false;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }
}
