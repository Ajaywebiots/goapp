import 'package:goapp/screens/bottom_screens/home_screen/layouts/qr_scanner_screen.dart';

import '../../../../config.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';

class HomeAppBar extends StatelessWidget {
  final String? location;
  final GestureTapCallback? onTap;

  const HomeAppBar({super.key, this.location, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          final prefs = snapshot.data;
          final accountType = prefs?.getString(session.accountType);
          final showIcon = accountType?.toLowerCase() == 'business';
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
                  Row(children: [
                    if (showIcon)
                      Image.asset(
                              width: 32,
                              height: 32,
                              "assets/images/qrCodeScanner.png")
                          .inkWell(onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QRScannerScreen()));
                      }),
                    const HSpace(Sizes.s10),
                    Container(
                            alignment: Alignment.center,
                            height: Sizes.s40,
                            width: Sizes.s40,
                            child: SvgPicture.asset(eSvgAssets.notification,
                                alignment: Alignment.center,
                                fit: BoxFit.scaleDown,
                                colorFilter: ColorFilter.mode(
                                    appColor(context).darkText,
                                    BlendMode.srcIn)))
                        .decorated(
                            shape: BoxShape.circle,
                            color: appColor(context).fieldCardBg)
                        .inkWell(onTap: () => value.notificationTap(context))
                        .paddingOnly(
                            right: rtl(context) ? 0 : Insets.i20,
                            left: rtl(context) ? Insets.i20 : 0)
                  ])
                ]);
          });
        });
  }
}
