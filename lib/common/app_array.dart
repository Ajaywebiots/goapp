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

  List<Map<String, dynamic>> loginOptions = [
    {
      "image": eImageAssets.google,
      "onTap": (BuildContext context, dynamic value) =>
          value.googleLogin(context),
    },
    {
      "image": eImageAssets.fbLogo,
      "onTap": (BuildContext context, dynamic value) =>
          value.loginWithFacebook(),
    },
    {
      "image": eImageAssets.mobile,
      "onTap": (BuildContext context, dynamic value) =>
          route.pushNamed(context, routeName.loginWithPhone),
    },
  ];
}
