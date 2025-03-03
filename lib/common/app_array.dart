import 'dart:ui';

import '../config.dart';

class AppArray {
  var localList = <Locale>[
    const Locale('en'),
    const Locale('el'),
    const Locale('he'),
  ];

  var languageList = [
    {
      "title": "English",
      "locale": const Locale('en', 'EN'),
      "code": "en",
    },
    {
      "title": "Greek",
      "locale": const Locale("el", 'GR'),
      "code": "el",
    },
    {
      "title": "Hebrew",
      "locale": const Locale('he', 'HE'),
      "code": "he",
    },
  ];
}
