import '../../../../config.dart';

class LanguageDropDownLayout extends StatelessWidget {
  const LanguageDropDownLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
        builder: (context, onBoardingCtrl, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: Sizes.s83,
            height: 34,
            child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                        child: DropdownButton<String>(
                            value: onBoardingCtrl.selectedLanguage,
                            items: onBoardingCtrl.langModel?.supportedLanguages!
                                .map((String lang) {
                              return DropdownMenuItem<String>(
                                  value: lang,
                                  child: Text(lang.toUpperCase(),
                                      style: appCss.dmDenseRegular12.textColor(
                                          appColor(context).darkText)));
                            }).toList(),
                            icon: SvgPicture.asset(eSvgAssets.arrowDown),
                            onChanged: (String? newValue) =>
                                onBoardingCtrl.onChanged(newValue))))
                .paddingDirectional(horizontal: Insets.i8)
                .decorated(
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
        if (onBoardingCtrl.selectIndex !=
            onBoardingCtrl.onBoardingList.length - 1)
          Text(language(context, appFonts.skip),
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).lightText))
              .inkWell(onTap: () => onBoardingCtrl.onSkip(context))
      ]);
    });
  }
}
