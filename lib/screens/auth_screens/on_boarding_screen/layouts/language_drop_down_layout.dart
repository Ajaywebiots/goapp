import '../../../../config.dart';

class LanguageDropDownLayout extends StatelessWidget {
  const LanguageDropDownLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LanguageProvider, OnBoardingProvider>(
        builder: (context, langProvider, onBoardingCtrl, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: Sizes.s90,
            height: Insets.i34,
            child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                    child: DropdownButton(
                        value: langProvider.currentLanguage.toString(),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r8)),
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).lightText),
                        icon: SvgPicture.asset(eSvgAssets.dropDown,
                            colorFilter: ColorFilter.mode(
                                appColor(context).darkText, BlendMode.srcIn)),
                        isExpanded: true,
                        hint: Text(langProvider.currentLanguage
                            .substring(0, 2)
                            .toString()),
                        selectedItemBuilder: (context) {
                          int index = appArray.languageList.indexWhere(
                              (element) =>
                                  element['title'] ==
                                  langProvider.currentLanguage);
                          return LanguageList()
                              .langList(index, context, isFlag: true);
                        },
                        items: appArray.languageList.asMap().entries.map((e) {
                          return LanguageList().dropDown(e.value, context,
                              onTap: () => langProvider
                                  .changeLocale(e.value["title"].toString()));
                        }).toList(),
                        onChanged: (val) async {
                          langProvider.currentLanguage = val.toString();
                          langProvider
                              .changeLocale(langProvider.currentLanguage);
                        }))).paddingDirectional(horizontal: Insets.i8).decorated(
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
        // if (onBoardingCtrl.selectIndex !=
        //     onBoardingCtrl.onBoardingList.length - 1)
        Text(language(context, appFonts.skip),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).lightText))
            .inkWell(onTap: () => onBoardingCtrl.onSkip(context))
      ]);
    });
  }
}

class LanguageList {
  List<Widget> langList(index, context, {isFlag = false}) =>
      List.generate(appArray.languageList.length, (i) {
        return i == index
            ? Row(children: [
                isFlag
                    ? Container(
                        height: Sizes.s20,
                        width: Sizes.s20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(appArray.languageList[index]
                                        ["icon"]
                                    .toString()))))
                    : SvgPicture.asset(eSvgAssets.translate,
                        width: 20, height: 20),
                const HSpace(Sizes.s10),
                Text(
                    language(context,
                            appArray.languageList[index!]["title"]!.toString())
                        .substring(0, 2)
                        .toUpperCase(),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText))
              ])
            : Container();
      });

  DropdownMenuItem dropDown(data, context, {GestureTapCallback? onTap}) =>
      DropdownMenuItem(
          value: data["title"],
          onTap: onTap,
          child: Row(children: [
            SizedBox(
                child: Text(language(context, data["title"]!.toString()),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).lightText),
                    overflow: TextOverflow.ellipsis))
          ]));
}
