import 'package:goapp/providers/app_pages_provider/profile_detail_provider.dart';
import 'package:goapp/screens/menu_screens/layouts/profile_layout.dart';

import '../../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';

class ProfileSettingTopLayout extends StatelessWidget {
  const ProfileSettingTopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DirectionalityRtl(
        child: Consumer<ProfileDetailProvider>(builder: (context, ddd, child) {
      return Column(children: [
        ProfileLayout(
            onTap: () => route.pushNamed(context, routeName.profileDetails)),
        Stack(children: [
          VSpace(Insets.i20),
          Container(
                  height: Sizes.s66,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(eImageAssets.balanceContainer))),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(language(context, appFonts.accountType),
                              style: appCss.dmDenseRegular12.textColor(
                                  appColor(context)
                                      .whiteBg
                                      .withValues(alpha: 0.7))),
                          Text(language(context, ddd.accountType ?? ""),
                              style: appCss.dmDenseMedium13
                                  .textColor(appColor(context).whiteBg))
                        ]),
                    const VSpace(Sizes.s4),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(language(context, appFonts.membershipStatus),
                              style: appCss.dmDenseRegular12.textColor(
                                  appColor(context)
                                      .whiteBg
                                      .withValues(alpha: 0.7))),
                          Text(ddd.memberStatus ?? "",
                              style: appCss.dmDenseMedium13
                                  .textColor(appColor(context).whiteBg))
                        ])
                  ]).paddingSymmetric(
                      vertical: Insets.i12, horizontal: Insets.i15))
              .marginSymmetric(horizontal: Insets.i12)
              .paddingOnly(top: Insets.i20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset(eSvgAssets.attachLine),
            SvgPicture.asset(eSvgAssets.attachLine)
          ]).paddingSymmetric(horizontal: Insets.i40)
        ])
      ]);
    }));
  }
}
