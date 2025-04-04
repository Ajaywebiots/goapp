import 'package:goapp/screens/menu_screens/layouts/profile_layout.dart';

import '../../../../config.dart';

class ProfileSettingTopLayout extends StatelessWidget {
  const ProfileSettingTopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ProfileLayout(
          onTap: () => route.pushNamed(context, routeName.profileDetails)),
      Stack(
        children: [
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
                          Text(language(context, "Account Type"),
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).whiteBg)),
                          Text(language(context, "Standard"),
                              style: appCss.dmDenseMedium12
                                  .textColor(appColor(context).whiteBg))
                        ]),
                    const VSpace(Sizes.s4),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(language(context, "Membership Status"),
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).whiteBg)),
                          Text("Not Active",
                              style: appCss.dmDenseMedium12
                                  .textColor(appColor(context).whiteBg))
                        ])
                  ]).paddingSymmetric(
                      vertical: Insets.i12, horizontal: Insets.i15))
              .marginSymmetric(horizontal: Insets.i12)
              .paddingOnly(top: Insets.i20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset(eSvgAssets.attachLine),
            SvgPicture.asset(eSvgAssets.attachLine)
          ]).paddingSymmetric(horizontal: Insets.i40),
        ],
      ),
    ]);
  }
}
