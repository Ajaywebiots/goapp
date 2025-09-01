import '../../../../config.dart';

class HomeAppBar extends StatelessWidget {
  final String? location;
  final GestureTapCallback? onTap;

  const HomeAppBar({super.key, this.location, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          return Consumer<HomeScreenProvider>(
              builder: (context1, value, child) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const HSpace(Sizes.s15),
                    Image.asset(eImageAssets.appLogo, height: Insets.i60),
                    Text(language(context, appFonts.goSalamina),
                        style: appCss.outfitMedium26
                            .textColor(appColor(context).darkText))
                  ]),
                  const HSpace(Sizes.s10),
                  InkWell(onTap: () => route.pushNamed(context, routeName.notifications),
                    child: Container(
                            alignment: Alignment.center,
                            height: Sizes.s40,
                            width: Sizes.s40,
                            child: SvgPicture.asset(eSvgAssets.notification,
                                alignment: Alignment.center,
                                fit: BoxFit.scaleDown,
                                colorFilter: ColorFilter.mode(
                                    appColor(context).darkText, BlendMode.srcIn)))
                        .decorated(
                            shape: BoxShape.circle,
                            color: appColor(context).fieldCardBg)
                        .paddingOnly(
                            right: rtl(context) ? 0 : Insets.i20,
                            left: rtl(context) ? Insets.i20 : 0),
                  )
                ]);
          });
        });
  }
}
