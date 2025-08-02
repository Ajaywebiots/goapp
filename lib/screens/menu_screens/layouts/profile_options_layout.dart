import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:goapp/screens/menu_screens/layouts/profile_option_layout.dart';
import '../../../../config.dart';
import '../../../models/profile_model.dart';
import 'options_selection_screen_layout/option_screen_layout.dart';

class ProfileOptionsLayout extends StatelessWidget {
  const ProfileOptionsLayout({super.key});

  getIconFromString(iconName) {
    switch (iconName) {
      case 'person':
        return eSvgAssets.profile;
      case 'favorite':
        return Icons.favorite_border;
      case 'reviews':
        return Icons.reviews;
      case 'language':
        return Icons.language;
      case 'membership':
        return Icons.workspace_premium;
      case 'travel':
        return Icons.travel_explore;
      case 'business':
        return Icons.business_center;
      case 'municipality':
        return Icons.account_balance;
      case 'support':
        return Icons.support_agent;
      case 'about':
        return Icons.info_outline;
      case 'privacy':
        return Icons.privacy_tip;
      case 'terms':
        return Icons.assignment_turned_in_outlined;
      case 'faq':
        return Icons.help_outline;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<SignUpCompanyProvider, ProfileProvider>(
        builder: (context, value, profilePvr, child) {
      return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            VSpace(Insets.i10),
            ...appArray.profileList
                .map((e) => ProfileModel.fromJson(e))
                .toList()
                .asMap()
                .entries
                .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                                  language(context, e.value.title)
                                      .toString()
                                      .toUpperCase(),
                                  style: appCss.dmDenseBold14
                                      .textColor(appColor(context).primary))
                              .paddingSymmetric(vertical: Insets.i15),
                          if (e.value.data != null)
                            Container(
                                decoration: ShapeDecoration(
                                    color: appColor(context).whiteColor,
                                    shadows: [
                                      BoxShadow(
                                          color: appColor(context)
                                              .darkText
                                              .withAlpha(15),
                                          spreadRadius: 1,
                                          blurRadius: 2)
                                    ],
                                    shape: SmoothRectangleBorder(
                                        side: BorderSide(
                                            color:
                                                appColor(context).fieldCardBg),
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
                                          icon: getIconFromString(s.value.icon),
                                          onTap: () async {
                                            log("klhdfjkldsnfd dsfndfsmvf ${s.value.title}");
                                            if (s.value.title ==
                                                appFonts.myProfile) {
                                              log("jkdfgadjksfgas ${appFonts.myProfile}");
                                              route.pushNamed(context,
                                                  routeName.profileDetails);
                                            } else if (s.value.title ==
                                                appFonts.favouriteList) {
                                              route.pushNamed(context,
                                                  routeName.favScreenList);
                                            } else if (s.value.title ==
                                                appFonts.myReviews) {
                                              route.pushNamed(context,
                                                  routeName.reviewScreen);
                                            } else if (s.value.title ==
                                                appFonts.appSettings) {
                                              route.pushNamed(context,
                                                  routeName.changeLanguage);
                                            } else if (s.value.title ==
                                                appFonts.subscriptionPlans) {
                                              route.pushNamed(
                                                  context,
                                                  routeName
                                                      .subscriptionPlanScreen);
                                            } else {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return OptionScreenLayout(
                                                    title: language(context,
                                                        s.value.title));
                                              }));
                                            }
                                          }))
                                ]).paddingAll(Insets.i15))
                        ])),
            VSpace(Insets.i30),
            registerBusinessCard(context),
            VSpace(Insets.i20),
            logoutButton(context, profilePvr)
          ]);
    });
  }
}

Widget logoutButton(BuildContext context, ProfileProvider profilePvr) {
  return Container(
      margin: const EdgeInsets.only(top: 0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: ShapeDecoration(
          color: const Color(0xffF0F0F0),
          // shadows: [
          //   BoxShadow(
          //       color: appColor(context).darkText.withOpacity(0.06),
          //       spreadRadius: 1,
          //       blurRadius: 4)
          // ],
          shape: SmoothRectangleBorder(
              side: BorderSide(color: appColor(context).fieldCardBg),
              borderRadius: SmoothBorderRadius(
                  cornerRadius: AppRadius.r12, cornerSmoothing: 1))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          CommonArrow(
              arrow: eSvgAssets.logout,
              color: appColor(context).whiteBg,
              svgColor: appColor(context).darkText),
          const HSpace(Sizes.s15),
          Text(language(context, appFonts.logout),
              style:
                  appCss.dmDenseMedium14.textColor(appColor(context).darkText))
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

// Widget buildGridLayout(BuildContext context) {
//   return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           childAspectRatio: 1,
//           mainAxisExtent: MediaQuery.of(context).size.height * (140 / 800)),
//       itemCount: appArray.menuItems(context).length,
//       itemBuilder: (context, index) {
//         final item = appArray.menuItems(context)[index];
//         return Stack(alignment: Alignment.topCenter, children: [
//           Container(
//                   alignment: Alignment.bottomCenter,
//                   width: 105,
//                   height: 105,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                       color: appColor(context).fieldCardBg),
//                   child: Text(
//                           language(
//                               context, item.title.replaceFirst(' ', '\n')),
//                           textAlign: TextAlign.center,
//                           style: appCss.dmDenseMedium14
//                               .textColor(appColor(context).darkText))
//                       .paddingOnly(bottom: 24))
//               .marginSymmetric(horizontal: Insets.i5, vertical: 25),
//           Positioned(
//               top: MediaQuery.of(context).size.height * (0 / 800),
//               child: Container(
//                   width: Insets.i46,
//                   height: Insets.i46,
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           width: 3, color: appColor(context).whiteBg),
//                       color: Colors.white,
//                       shape: BoxShape.circle),
//                   child: Container(
//                       padding: EdgeInsets.all(Insets.i10),
//                       width: Insets.i40,
//                       height: Insets.i40,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 1, color: appColor(context).stroke),
//                           boxShadow: [
//                             BoxShadow(
//                                 blurRadius: 3,
//                                 spreadRadius: 2,
//                                 offset: Offset(1, 2),
//                                 color: appColor(context)
//                                     .darkText
//                                     .withOpacity(0.05))
//                           ],
//                           color: appColor(context).whiteBg,
//                           shape: BoxShape.circle),
//                       child: item.icon)))
//         ]).inkWell(onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return OptionScreenLayout(title: item.title);
//           }));
//         });
//       });
// }
//
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
                  rtl(context) ? eSvgAssets.arrowLeft : eSvgAssets.arrowRight,
                  colorFilter: ColorFilter.mode(
                      appColor(context).darkText, BlendMode.srcIn))
            ]))
      ])).inkWell(onTap: () {});
}
