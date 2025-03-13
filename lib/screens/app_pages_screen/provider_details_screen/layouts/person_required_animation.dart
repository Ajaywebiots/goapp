import '../../../../common/languages/app_language.dart';
import '../../../../config.dart';

class PersonRequiredAnimation extends StatelessWidget {
  final GestureTapCallback? minusTap, addTap;
  final int? requiredMan;

  const PersonRequiredAnimation(
      {super.key, this.addTap, this.minusTap, this.requiredMan});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ProviderDetailsProvider>(context);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          width: Sizes.s180,
          child: Text(language(context, appFonts.howManyPerson),
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).appTheme.darkText))),
      Stack(
          alignment: !value.visible ? Alignment.topRight : Alignment.center,
          children: [
            Container(
                width: Sizes.s100,
                height: 40,
                decoration: BoxDecoration(
                    color: appColor(context).appTheme.fieldCardBg,
                    borderRadius: BorderRadius.circular(6))),
            SizedBox(
                width: Sizes.s100,
                height: Sizes.s40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: minusTap,
                          child: SvgPicture.asset(eSvgAssets.minus).paddingOnly(
                              left: AppLocalizations.of(context)
                                          ?.locale
                                          .languageCode ==
                                      "ar"
                                  ? 0
                                  : 8,right: AppLocalizations.of(context)?.locale.languageCode == "ar"?8 : 0)),
                      Text(
                        "$requiredMan",
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).appTheme.darkText),
                      ),
                      Container(
                          decoration: ShapeDecoration(
                              color: appColor(context).appTheme.primary,
                              shape: SmoothRectangleBorder(
                                  borderRadius: SmoothBorderRadius(
                                      cornerRadius: 6, cornerSmoothing: 1))),
                          child: IconButton(
                              onPressed: addTap, icon:  Icon(Icons.add,color: appColor(context).appTheme.whiteColor,))).inkWell(onTap: addTap)
                    ]))
          ])
    ])
        .paddingAll(Insets.i15)
        .boxBorderExtension(context, isShadow: true)
        .paddingOnly(top: Insets.i10, bottom: Insets.i10);
  }
}
