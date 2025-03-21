import 'package:nb_utils/nb_utils.dart';

import '../../../../config.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';

class HomeAppBar extends StatelessWidget {
  final String? location;
  final GestureTapCallback? onTap;

  const HomeAppBar({super.key, this.location, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
      print("setPrimaryAddress :$setPrimaryAddress");
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        /* Row(children: [
          const HSpace(Sizes.s20),
          CommonArrow(
              onTap: () => value.locationTap(context),
              arrow: eSvgAssets.location,
              svgColor: appColor(context).primary,
              color: appColor(context).primary.withOpacity(0.2)),
          const HSpace(Sizes.s10),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(language(context, appFonts.currentLocation),
                          style: appCss.dmDenseRegular12
                              .textColor(appColor(context).lightText)),
                      const HSpace(Sizes.s5),
                      SvgPicture.asset(eSvgAssets.arrowDown)
                    ]).inkWell(onTap: () => value.locationTap(context)),
                SizedBox(
                  width: Sizes.s180,
                  child: Text(language(context, appFonts.salamina),
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmDenseBold14
                          .textColor(appColor(context).darkText)),
                )
              ])
        ]),*/
        Row(children: [
          const HSpace(Sizes.s20),
          Image.asset(
            eImageAssets.appLogo,
            height: 70,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(language(context, appFonts.goSalamina),
                    style: appCss.outfitMedium24
                        .textColor(appColor(context).darkText)
                        .textHeight(1)),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text(language(context, appFonts.salamina),
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).lightText)
                          .textHeight(1)),
                  const HSpace(Sizes.s5),
                  SvgPicture.asset(eSvgAssets.arrowDown)
                ]).inkWell(onTap: () => value.locationTap(context))
              ])
        ]),
        Row(children: [
          CommonArrow(arrow: eSvgAssets.search).inkWell(onTap: () {
            route.pushNamed(context, routeName.search).then((e) {
              value.animationController!.reset();
              value.notifyListeners();
            });
          }),
          const HSpace(Sizes.s10),
          Container(
                  alignment: Alignment.center,
                  height: Sizes.s40,
                  width: Sizes.s40,
                  child: Stack(alignment: Alignment.topRight, children: [
                    SvgPicture.asset(eSvgAssets.notification,
                        alignment: Alignment.center,
                        fit: BoxFit.scaleDown,
                        colorFilter: ColorFilter.mode(
                            appColor(context).darkText, BlendMode.srcIn)),
                    Positioned(
                        top: 2,
                        right: 2,
                        child: Icon(Icons.circle,
                            size: Sizes.s7, color: appColor(context).red))
                  ]))
              .decorated(
                  shape: BoxShape.circle, color: appColor(context).fieldCardBg)
              .inkWell(onTap: () => value.notificationTap(context))
              .paddingOnly(
                  right: rtl(context) ? 0 : Insets.i20,
                  left: rtl(context) ? Insets.i20 : 0)
        ])
      ]);
    });
  }
}
