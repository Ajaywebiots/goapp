import 'package:intl/intl.dart';

import '../../../../config.dart';

class CouponLayout extends StatelessWidget {
  final CouponModel? data;
  final GestureTapCallback? onTap;

  const CouponLayout({super.key, this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(appColor(context).isDarkMode ?eImageAssets.couponDark : eImageAssets.coupon,
          height: Sizes.s130,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill),
      Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(flex: 4,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(language(context, "${language(context, appFonts.spend)} ${data!.minSpend} ${language(context, appFonts.amount)}"),
                  style: appCss.dmDenseBold14
                      .textColor(appColor(context).appTheme.darkText)),
              RichText(
                  text: TextSpan(
                      text: language(context, appFonts.useCode),
                      style: appCss.dmDenseMedium12
                          .textColor(appColor(context).appTheme.lightText),
                      children: [
                    TextSpan(
                        style: appCss.dmDenseBold12
                            .textColor(appColor(context).appTheme.lightText),
                        text: " ${data!.code} "),
                    TextSpan(
                        style: appCss.dmDenseMedium12
                            .textColor(appColor(context).appTheme.lightText),
                        text: "${language(context, appFonts.toSave)} ${'${data!.amount}${data!.type == "percentage" ? "%":"${getSymbol(context)}"}\n${language(context,appFonts.off)}'} ${language(context, appFonts.ofRealPrice)}")
                  ]))
            ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Image.asset(eImageAssets.dashLines, height: Sizes.s50),
              const HSpace(Sizes.s17),
              Text(
              '${data!.amount}${data!.type == "percentage" ? "%":"${getSymbol(context)}"}\n${language(context, appFonts.off).toUpperCase()}',
                  style: appCss.dmDenseBold14
                      .textColor(appColor(context).appTheme.darkText))
            ]),
          )
        ]),
        const VSpace(Sizes.s28),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RichText(
              text: TextSpan(
                  text: language(context, appFonts.validTill),
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).appTheme.lightText),
                  children: [
                TextSpan(
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).appTheme.darkText),
                    text: " ${data!.endDate ?? DateFormat("yyyy-MM-dd").format(DateTime.now())}")
              ])),
          Row(children: [
            Text(language(context, appFonts.useCode),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).appTheme.primary)),
            const HSpace(Sizes.s5),
            SvgPicture.asset(eSvgAssets.anchorArrowRight,
                colorFilter: ColorFilter.mode(
                    appColor(context).appTheme.primary, BlendMode.srcIn))
          ]).inkWell(onTap: onTap)
        ])
      ]).paddingAll(Insets.i15)
    ]).paddingOnly(bottom: Insets.i20);
  }
}
