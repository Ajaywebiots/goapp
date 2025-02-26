import 'package:goapp/config.dart';

class AppArray {
  List<Map<String, String>> get onBoardingList => [
        {
          "title": appFonts.explore,
          "subtext": appFonts.discover,
        },
        {
          "title": appFonts.unlock,
          "subtext": appFonts.access,
        },
        {
          "title": appFonts.connect,
          "subtext": appFonts.engage,
        },
        {
          "title": appFonts.things,
          "subtext": appFonts.discoverLocal,
        },
      ];
}
