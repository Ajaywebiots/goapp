import 'dart:developer';

import 'package:goapp/screens/menu_screens/layouts/profile_layout.dart';
import '../../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../bottom_screens/home_screen/layouts/guest_login_sheet.dart';

class ProfileSettingTopLayout extends StatefulWidget {
  const ProfileSettingTopLayout({super.key});

  @override
  State<ProfileSettingTopLayout> createState() =>
      _ProfileSettingTopLayoutState();
}

class _ProfileSettingTopLayoutState extends State<ProfileSettingTopLayout> {
  bool isGuest = false;

  @override
  void initState() {
    super.initState();
    loadGuestStatus();
  }


  loadGuestStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(session.accessToken);
    setState(() {
      // If accessToken is null or empty, user is a guest
      isGuest = accessToken == null || accessToken.isEmpty;
      log(
        "Guest status: $isGuest, AccessToken: ${accessToken != null ? 'exists' : 'null'}",
      );
    });
  }


  void showGuestLoginSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => GuestLoginSheet(
        onLoginSuccess: () {
          Navigator.pop(context);
          route.pushNamed(
            context,
            routeName.login,
            arg: {"redirectTo": routeName.dashboard, "selectIndex": 4},
          );
          log("Redirecting to login from profile screen");
          log("Guest login ${routeName.dashboard} ----- 4");
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return DirectionalityRtl(
      child: Consumer<ProfileDetailProvider>(
        builder: (context, ddd, child) {
          return Column(
            children: [
              ProfileLayout(
                onTap: isGuest
                    ? ()=> showGuestLoginSheet()
                    : () => route.pushNamed(context, routeName.profileDetails),
              ),
              // Stack(
              //   children: [
              //     VSpace(Insets.i20),
              //     Container(
              //           height: Sizes.s66,
              //           width: MediaQuery.of(context).size.width,
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //               fit: BoxFit.fill,
              //               image: AssetImage(eImageAssets.balanceContainer),
              //             ),
              //           ),
              //           child:
              //               Column(
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         language(context, appFonts.accountType),
              //                         style: appCss.dmDenseRegular12.textColor(
              //                           appColor(
              //                             context,
              //                           ).whiteBg.withValues(alpha: 0.7),
              //                         ),
              //                       ),
              //                       Text(
              //                         language(context, ddd.accountType ?? ""),
              //                         style: appCss.dmDenseMedium13.textColor(
              //                           appColor(context).whiteBg,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   const VSpace(Sizes.s4),
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         language(
              //                           context,
              //                           appFonts.membershipStatus,
              //                         ),
              //                         style: appCss.dmDenseRegular12.textColor(
              //                           appColor(
              //                             context,
              //                           ).whiteBg.withValues(alpha: 0.7),
              //                         ),
              //                       ),
              //                       Text(
              //                         ddd.memberStatus ?? "",
              //                         style: appCss.dmDenseMedium13.textColor(
              //                           appColor(context).whiteBg,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ).paddingSymmetric(
              //                 vertical: Insets.i12,
              //                 horizontal: Insets.i15,
              //               ),
              //         )
              //         .marginSymmetric(horizontal: Insets.i12)
              //         .paddingOnly(top: Insets.i20),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         SvgPicture.asset(eSvgAssets.attachLine),
              //         SvgPicture.asset(eSvgAssets.attachLine),
              //       ],
              //     ).paddingSymmetric(horizontal: Insets.i40),
              //   ],
              // ),
            ],
          );
        },
      ),
    );
  }
}
