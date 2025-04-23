import 'package:flutter/cupertino.dart';
import 'package:goapp/screens/menu_screens/layouts/profile_option_layout.dart';

import '../../../../config.dart';
import '../../../providers/bottom_providers/profile_provider.dart';

class ProfileOptionsLayout extends StatelessWidget {
  const ProfileOptionsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ProfileProvider>(context, listen: true);
    return Column(
        children: value.profileLists
            .asMap()
            .entries
            .map((e) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  e.key == 1
                      ? Container(
                          margin: EdgeInsets.only(top: 32, bottom: Sizes.s15),
                          padding: EdgeInsets.all(Sizes.s15),
                          decoration: BoxDecoration(
                              color: Color(0xfff99D1C).withValues(alpha: 0.5),
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
                                  Expanded(
                                      child: Text(
                                          overflow: TextOverflow.fade,
                                          language(context, e.value.title)
                                              .toString(),
                                          style: appCss.dmDenseMedium16
                                              .textColor(
                                                  appColor(context).darkText))),
                                  SvgPicture.asset(
                                      rtl(context)
                                          ? eSvgAssets.arrowLeft
                                          : eSvgAssets.arrowRight,
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
                                      .withValues(alpha: 0.06),
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
                                    if (s.value.title == appFonts.myProfile) {
                                      route.pushNamed(
                                          context, routeName.profileDetails);
                                    } else if (s.value.title ==
                                        appFonts.favouriteList) {
                                      route.pushNamed(
                                          context, routeName.favScreenList);
                                    } else if (s.value.title ==
                                        appFonts.myReviews) {
                                      route.pushNamed(
                                          context, routeName.reviewScreen);
                                    } else if (s.value.title ==
                                        appFonts.appSettings) {
                                      route.pushNamed(
                                          context, routeName.appSetting);
                                    } else if (s.value.title ==
                                        appFonts.subscriptionPlans) {
                                      route.pushNamed(context,
                                          routeName.subscriptionPlanScreen);
                                    } else if (s.value.title ==
                                        appFonts.aboutUs) {
                                      value.appPagesAPI(context, "ABOUTUS");
                                    } else if (s.value.title ==
                                        appFonts.privacyPolicy) {
                                      value.appPagesAPI(context, "PRIVACY");
                                    } else if (s.value.title ==
                                        appFonts.termCondition) {
                                      value.appPagesAPI(context, "TERMS");
                                    } else if (s.value.title ==
                                        appFonts.cancellationPolicy) {
                                      value.appPagesAPI(
                                          context, "CANCELLATION");
                                    } else if (s.value.title ==
                                        appFonts.contactUs) {
                                      route.pushNamed(
                                          context, routeName.contactUs);
                                    } else if (s.value.title == appFonts.faq) {
                                      value.appPagesAPI(context, "FAQ");
                                    } else if (s.value.title ==
                                        appFonts.logout) {
                                      showCupertinoDialog(
                                          context: context,
                                          builder: (context1) {
                                            return AlertDialogCommon(
                                                title: language(
                                                    context, appFonts.logout),
                                                fit: BoxFit.contain,
                                                vertical: 0,
                                                subtextVSpace: 28,
                                                bottomPadding: 0,
                                                horizontal: 0,
                                                height: Sizes.s200,
                                                isTwoButton: true,
                                                image:
                                                    'assets/images/logout.png',
                                                subtext: language(
                                                    context,
                                                    appFonts
                                                        .logoutConfirmation),
                                                secondBText: language(
                                                    context, appFonts.yes),
                                                firstBText: language(
                                                    context, appFonts.cancel),
                                                firstBTap: () {
                                                  route.pop(context);
                                                },
                                                secondBTap: () async =>
                                                    value.logOut(context));
                                          });
                                    }
                                  }))
                        ]).paddingAll(Insets.i15))
                ]))
            .toList());
  }
}
