import 'dart:developer';

import '../../../../config.dart';

class LanguageDropDownLayout extends StatelessWidget {
  const LanguageDropDownLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
        builder: (context, onBoardingCtrl, child) {
      // log("languageCtrl.currentLanguage::${langProvider.currentLanguage}");
      // log("Language List: ${langProvider.sharedPreferences.getString("selectedLocale")}");
      // String? val = langProvider.sharedPreferences.getString("selectedLocale");
      // final currentLanguage =
      //     langProvider.languageList.any((element) => element.locale == val)
      //         ? langProvider.languageList
      //             .firstWhere((element) => element.locale == val)
      //             .name
      //         : null;

      log("asssadasdnasjkdfds ${onBoardingCtrl.langModel?.supportedLanguages}");
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: Sizes.s100,
            child: DropdownButtonHideUnderline(
                child: ButtonTheme(
              child: DropdownButton<String>(
                  value: onBoardingCtrl.selectedLanguage,
                  items: onBoardingCtrl.langModel?.supportedLanguages!
                      .map((String lang) {
                    return DropdownMenuItem<String>(
                      value: lang,
                      child: Text(lang),
                    );
                  }).toList(),
                  onChanged: (String? newValue) =>
                      onBoardingCtrl.onChanged(newValue)),
            )).paddingAll(Insets.i7).decorated(
                color: appColor(context).whiteBg,
                borderRadius: BorderRadius.circular(AppRadius.r6),
                boxShadow: isDark(context)
                    ? []
                    : [
                        BoxShadow(
                            color: appColor(context).fieldCardBg,
                            blurRadius: AppRadius.r10,
                            spreadRadius: AppRadius.r5)
                      ],
                border: Border.all(color: appColor(context).fieldCardBg))),
        if (onBoardingCtrl.selectIndex != appArray.onBoardingList.length - 1)
          Text(language(context, appFonts.skip),
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).lightText))
              .inkWell(onTap: () => onBoardingCtrl.onSkip(context))
      ]);
    });
  }
}
