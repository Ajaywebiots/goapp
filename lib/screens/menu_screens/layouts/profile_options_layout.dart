import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:goapp/screens/menu_screens/layouts/profile_option_layout.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config.dart';
import '../../../providers/bottom_providers/profile_provider.dart';

class ProfileOptionsLayout extends StatelessWidget {
  const ProfileOptionsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ProfileProvider>(context, listen: true);
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Column(
          children: value.profileLists
              .asMap()
              .entries
              .map((e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // if (e.key != 3)
                        e.key == 1
                            ? Container(
                                margin:
                                    EdgeInsets.only(top: 32, bottom: Sizes.s15),
                                padding: EdgeInsets.all(Sizes.s15),
                                decoration: BoxDecoration(
                                    color: Color(0xfff99D1C)
                                        .withValues(alpha: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Row(children: [
                                  CircleAvatar(
                                      backgroundImage:
                                          AssetImage(eImageAssets.profile)),
                                  HSpace(Sizes.s15),
                                  Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                        Text(
                                            language(context, e.value.title)
                                                .toString(),
                                            style: appCss.dmDenseMedium16
                                                .textColor(appColor(context)
                                                    .darkText)),
                                        SvgPicture.asset(eSvgAssets.arrowRight,
                                            colorFilter: ColorFilter.mode(
                                                appColor(context).darkText,
                                                BlendMode.srcIn))
                                      ]))
                                ]))
                            : Text(
                                    language(context, e.value.title)
                                        .toString()
                                        .toUpperCase(),
                                    style: appCss.dmDenseBold14
                                        .textColor(appColor(context).primary))
                                .paddingSymmetric(vertical: Insets.i15),
                        if (e.value.data != null)
                          Container(
                              decoration: ShapeDecoration(
                                  color: e.value.data?[0].title == "Logout"
                                      ? Color(0xffF0F0F0)
                                      : appColor(context).whiteColor,
                                  shadows: [
                                    BoxShadow(
                                        color: appColor(context)
                                            .darkText
                                            .withOpacity(0.06),
                                        spreadRadius: 1,
                                        blurRadius: 2)
                                  ],
                                  shape: SmoothRectangleBorder(
                                      side: BorderSide(
                                          color: appColor(context).fieldCardBg),
                                      borderRadius: SmoothBorderRadius(
                                          cornerRadius: AppRadius.r12,
                                          cornerSmoothing: 1))),
                              child: Column(children: [
                                ...e.value.data!
                                    .asMap()
                                    .entries
                                    .map((s) => ProfileOptionLayout(
                                        indexMain: e.key,
                                        data: s.value,
                                        index: s.key,
                                        list: e.value.data,
                                        onTap: () async {
                                          if (s.value.title == "My Profile") {
                                            route.pushNamed(context,
                                                routeName.profileDetails);
                                            log("true eee");
                                          } else if (s.value.title ==
                                              "Favourite List") {
                                            log("true eee");
                                          } else if (s.value.title ==
                                              "My Reviews") {
                                            log("true eee");
                                          } else if (s.value.title ==
                                              "App Settings") {
                                            route.pushNamed(
                                                context, routeName.appSetting);
                                            log("true eee");
                                          } else if (s.value.title ==
                                              "Subscription Plans") {
                                            log("true eee");
                                          } else if (s.value.title ==
                                              "About Us") {
                                            route.pushNamed(
                                                context,
                                                routeName
                                                    .commonGeneralInfoLayout,
                                                arg: {
                                                  "image": eImageAssets.img1,
                                                  "appBarTitle": "About Us",
                                                  "title1": "Section Title",
                                                  "aboutDescription":
                                                      appFonts.aboutDescription,
                                                  "aboutDescription1": appFonts
                                                      .aboutDescription1,
                                                  "title2": "Section Title",
                                                  "aboutDescription2": appFonts
                                                      .aboutDescription2,
                                                  "aboutDescription3":
                                                      appFonts.aboutDescription3
                                                });
                                            log("true eee");
                                          } else if (s.value.title ==
                                              "Privacy Policy") {
                                            route.pushNamed(
                                                context,
                                                routeName
                                                    .commonGeneralInfoLayout,
                                                arg: {
                                                  "image": eImageAssets.img1,
                                                  "appBarTitle":
                                                      "Privacy Policy",
                                                  "title1": "Section Title",
                                                  "aboutDescription":
                                                      appFonts.aboutDescription,
                                                  "aboutDescription1": appFonts
                                                      .aboutDescription1,
                                                  "title2": "Section Title",
                                                  "aboutDescription2": appFonts
                                                      .aboutDescription2,
                                                  "aboutDescription3":
                                                      appFonts.aboutDescription3
                                                });
                                            log("true eee");
                                          } else if (s.value.title ==
                                              "Cancellation Policy") {
                                            route.pushNamed(
                                                context,
                                                routeName
                                                    .commonGeneralInfoLayout,
                                                arg: {
                                                  "image": eImageAssets.img1,
                                                  "appBarTitle":
                                                      "Cancellation Policy",
                                                  "title1": "Section Title",
                                                  "aboutDescription":
                                                      appFonts.aboutDescription,
                                                  "aboutDescription1": appFonts
                                                      .aboutDescription1,
                                                  "title2": "Section Title",
                                                  "aboutDescription2": appFonts
                                                      .aboutDescription2,
                                                  "aboutDescription3":
                                                      appFonts.aboutDescription3
                                                });
                                            log("true eee");
                                          } else if (s.value.title ==
                                              "Contact Us") {
                                            route.pushNamed(
                                                context, routeName.contactUs);
                                            log("true eee");
                                          } else if (s.value.title == "FAQ") {
                                            route.pushNamed(
                                                context,
                                                routeName
                                                    .commonGeneralInfoLayout,
                                                arg: {
                                                  "image": eImageAssets.img1,
                                                  "appBarTitle": "FAQ",
                                                  "title1":
                                                      "The first question",
                                                  "aboutDescription":
                                                      appFonts.aboutDescription,
                                                  "aboutDescription1": appFonts
                                                      .aboutDescription1,
                                                  "title2":
                                                      "The second question",
                                                  "aboutDescription2": appFonts
                                                      .aboutDescription2,
                                                  "aboutDescription3":
                                                      appFonts.aboutDescription3
                                                });
                                          } else if (s.value.title ==
                                              "Logout") {
                                            showCupertinoDialog(
                                                context: context,
                                                builder: (context1) {
                                                  return AlertDialogCommon(
                                                      title: "Logout",
                                                      fit: BoxFit.contain,
                                                      vertical: 0,
                                                      subtextVSpace: 28,
                                                      bottomPadding: 0,
                                                      horizontal: 0,
                                                      height: Sizes.s200,
                                                      isTwoButton: true,
                                                      image:
                                                          'assets/images/logout.png',
                                                      subtext: language(context,
                                                          "Are you sure you want to logout from this application , now ?"),
                                                      secondBText: "Yes",
                                                      firstBText: "Cancel",
                                                      firstBTap: () {
                                                        route.pop(context);
                                                      },
                                                      secondBTap: () async {
                                                        SharedPreferences
                                                            prefs =
                                                            await SharedPreferences
                                                                .getInstance();

                                                        await prefs.clear();

                                                        route
                                                            .pushReplacementNamed(
                                                                context,
                                                                routeName
                                                                    .login);
                                                      });
                                                });

                                            log("logout ===> ");
                                            log("true eee loggg ");
                                          }
                                        }))
                              ]).paddingAll(Insets.i15))
                      ]))
              .toList());
    });
  }
}
