import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config.dart';
import '../../../providers/app_pages_provider/register_company_provider.dart';
import '../../../providers/bottom_providers/profile_provider.dart';
import 'options_selection_screen_layout/option_screen_layout.dart';

class ProfileOptionsLayout extends StatelessWidget {
  const ProfileOptionsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider =
        Provider.of<SignUpCompanyProvider>(context, listen: false);

    return FutureBuilder(
        future: signUpProvider.loadAccountType(),
        builder: (context, snapshot) {
          return Consumer2<SignUpCompanyProvider, ProfileProvider>(
              builder: (context, value, profilePvr, child) {
            return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  VSpace(Insets.i10),
                  buildGridLayout(context),
                  value.isBusiness == false
                      ? myBusinessList(context, value)
                      : registerBusinessCard(context),
                  logoutButton(context, profilePvr)
                ]);
          });
        });
  }

  Widget buildGridLayout(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisExtent: MediaQuery.of(context).size.height * (140 / 800)),
        itemCount: appArray.menuItems(context).length,
        itemBuilder: (context, index) {
          final item = appArray.menuItems(context)[index];
          return Stack(alignment: Alignment.topCenter, children: [
            Container(
                    alignment: Alignment.bottomCenter,
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: appColor(context).fieldCardBg),
                    child: Text(item.title.replaceFirst(' ', '\n'),
                            textAlign: TextAlign.center,
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).darkText))
                        .paddingOnly(bottom: 24))
                .marginSymmetric(horizontal: Insets.i5, vertical: 25),
            Positioned(
                top: MediaQuery.of(context).size.height * (0 / 800),
                child: Container(
                    width: Insets.i46,
                    height: Insets.i46,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3, color: appColor(context).whiteBg),
                        color: Colors.white,
                        shape: BoxShape.circle),
                    child: Container(
                        padding: EdgeInsets.all(Insets.i10),
                        width: Insets.i40,
                        height: Insets.i40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: appColor(context).stroke),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  offset: Offset(1, 2),
                                  color: appColor(context)
                                      .darkText
                                      .withOpacity(0.05))
                            ],
                            color: appColor(context).whiteBg,
                            shape: BoxShape.circle),
                        child: item.icon)))
          ]).inkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OptionScreenLayout(title: item.title);
            }));
          });
        });
  }

  Widget registerBusinessCard(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(Sizes.s15),
            decoration: BoxDecoration(
                color: const Color(0xfff99D1C).withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Row(children: [
              CommonArrow(arrow: "assets/svg/bank.svg"),
              const HSpace(Sizes.s15),
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Expanded(
                        child: Text(
                            overflow: TextOverflow.fade,
                            language(context, appFonts.registerYourBusiness)
                                .toString(),
                            style: appCss.dmDenseMedium16
                                .textColor(appColor(context).darkText))),
                    SvgPicture.asset(
                        rtl(context)
                            ? eSvgAssets.arrowLeft
                            : eSvgAssets.arrowRight,
                        colorFilter: ColorFilter.mode(
                            appColor(context).darkText, BlendMode.srcIn))
                  ]))
            ]))
        .inkWell(
            onTap: () =>
                route.pushNamed(context, routeName.companyDetailsScreen));
  }

  Widget myBusinessList(BuildContext context, SignUpCompanyProvider provider) {
    return Consumer<MyBusinessProvider>(
        builder: (context, myBusinessPvr, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(language(context, "MY BUSINESS"),
            style: appCss.dmDenseBold14.textColor(appColor(context).primary)),
        Container(
            decoration: ShapeDecoration(
                color: appColor(context).whiteColor,
                shadows: [
                  BoxShadow(
                      color: appColor(context).fieldCardBg,
                      spreadRadius: 2,
                      blurRadius: 4)
                ],
                shape: SmoothRectangleBorder(
                    side: BorderSide(color: appColor(context).fieldCardBg),
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: AppRadius.r12, cornerSmoothing: 1))),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appArray.businessMenuList().length,
                itemBuilder: (context, index) {
                  final item = appArray.businessMenuList()[index];
                  return Column(children: [
                    ListTile(
                            onTap: () {
                              provider.onBusinessOnTap(context, item, index);
                              if (item.title == "My Business") {
                                log("ccxx cxcxcx cx");
                                myBusinessPvr.fetchBusinesses();
                              }
                            },
                            leading: item.icon.marginAll(Insets.i12).decorated(
                                shape: BoxShape.circle,
                                color: appColor(context).fieldCardBg),
                            title: Text(item.title,
                                style: appCss.dmDenseRegular14
                                    .textColor(appColor(context).darkText)),
                            trailing: SvgPicture.asset(eSvgAssets.arrowRight,
                                color: appColor(context).lightText))
                        .paddingDirectional(
                            top: index == 0 ? Sizes.s10 : 0,
                            bottom:
                                index == appArray.businessMenuList().length - 1
                                    ? Sizes.s10
                                    : 0),
                    if (index < appArray.businessMenuList().length - 1)
                      Divider(color: appColor(context).fieldCardBg, height: 0)
                          .paddingDirectional(vertical: Sizes.s5)
                  ]);
                })).paddingDirectional(top: Sizes.s20)
      ]).padding(bottom: Sizes.s20);
    });
  }

  Widget logoutButton(BuildContext context, ProfileProvider profilePvr) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: ShapeDecoration(
            color: const Color(0xffF0F0F0),
            shadows: [
              BoxShadow(
                  color: appColor(context).darkText.withOpacity(0.06),
                  spreadRadius: 1,
                  blurRadius: 2)
            ],
            shape: SmoothRectangleBorder(
                side: BorderSide(color: appColor(context).fieldCardBg),
                borderRadius: SmoothBorderRadius(
                    cornerRadius: AppRadius.r12, cornerSmoothing: 1))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            CommonArrow(
                arrow: eSvgAssets.logout,
                color: appColor(context).whiteBg,
                svgColor: appColor(context).darkText),
            const HSpace(Sizes.s15),
            Text(language(context, appFonts.logout),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).darkText))
          ])
        ])).inkWell(onTap: () {
      showCupertinoDialog(
          context: context,
          builder: (context1) {
            return AlertDialogCommon(
                title: language(context, appFonts.logout),
                fit: BoxFit.contain,
                vertical: 0,
                subtextVSpace: 28,
                bottomPadding: 0,
                horizontal: 0,
                height: Sizes.s200,
                isTwoButton: true,
                image: 'assets/images/logout.png',
                subtext: language(context, appFonts.logoutConfirmation),
                secondBText: language(context, appFonts.yes),
                firstBText: language(context, appFonts.cancel),
                firstBTap: () {
                  route.pop(context);
                },
                secondBTap: () => profilePvr.logOut(context));
          });
    });
  }
}

/*value.profileLists
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
            .toList()*/
