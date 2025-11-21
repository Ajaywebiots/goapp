import 'dart:developer';

import 'package:goapp/screens/menu_screens/menu_options_layouts/web_view_pages.dart';

import '../../../../config.dart';
import 'package:goapp/models/app_model/MenuItem.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';

class OptionScreenLayout extends StatelessWidget {
  final String? title;

  const OptionScreenLayout({super.key, this.title});

  // List<MenuItem> getMenuItems(BuildContext context, String? title, value) {
  //   if (title == language(context, appFonts.businessClub)) {
  //     return appArray.businessClubItems();
  //   } else if (title == language(context, appFonts.travelGuide)) {
  //     return appArray.travelGuideItems();
  //   } else if (title == language(context, appFonts.salaminaMunicipality)) {
  //     return appArray.municipalityItems();
  //   } else if (title == language(context, appFonts.myAccount)) {
  //     return appArray.myAccountItems();
  //   } else if (title == language(context, appFonts.appDetails)) {
  //     return appArray.appDetailsItems();
  //   } else if (title == language(context, appFonts.customerSupport)) {
  //     return appArray.customerSupportItems(context);
  //   } else {
  //     return [];
  //   }
  // }
  List<MenuItem> getMenuItems(BuildContext context, String? title, value) {
    if (title == language(context, appFonts.travelGuide)) {
      return appArray.travelGuideItems();
    } else if (title == language(context, appFonts.company)) {
      return appArray.companyItems();
    } else {
      return [];
    }
  }

  Map<String, VoidCallback> getActions(
    BuildContext context,
    ProfileProvider value,
  ) {
    return {
      language(context, appFonts.aboutUs): () =>
          value.appPagesAPI(context, PageSlug.aboutUs),
      language(context, appFonts.theMayorOfSalamina): () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              url: "https://dev.gosalamina.com/article/the-mayor-of-salamina",
            ),
          ),
        );
      },

      language(context, appFonts.emergencyNumbers): () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              url: "https://dev.gosalamina.com/article/emergency-numbers-in-salamina",
            ),
          ),
        );
      },

      // language(context, appFonts.contactUs): () {
      //   Provider.of<ContactUsProvider>(context, listen: false)
      //       .getSubjectData(context);
      //   route.pushNamed(context, routeName.contactUs);
      // },

      // language(context, appFonts.municipalityMessages): () =>
      //     value.appPagesAPI(context, PageSlug.municipalityMessages),
      language(context, appFonts.termsConditions): () =>
          value.appPagesAPI(context, PageSlug.terms),
      language(context, appFonts.privacyPolicy): () =>
          value.appPagesAPI(context, PageSlug.privacy),
      language(context, appFonts.cancellationPolicy): () =>
          value.appPagesAPI(context, PageSlug.cancellation),

      // language(context, appFonts.faq): () =>
      //     value.appPagesAPI(context, PageSlug.faq),
      language(context, appFonts.travelBlog): () =>
          route.pushNamed(context, routeName.latestBlogViewAll),
      language(context, appFonts.specialOffers): () {
        final dash = Provider.of<DashboardProvider>(context, listen: false);
        value.isProfileBack = true;
        dash.selectIndex = 2;
        dash.refreshData();
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          // Fallback to dashboard
          Navigator.pushNamedAndRemoveUntil(
            context,
            routeName.dashboard,
            (_) => false,
          );
        }
      },

      language(context, appFonts.explorePointsOfInterest): () {
        final dash = Provider.of<DashboardProvider>(context, listen: false);
        value.isProfileBack = true;
        dash.selectIndex = 3;
        dash.refreshData();
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            routeName.dashboard,
            (_) => false,
          );
        }
      },
      language(context, appFonts.businessListings): () {
        final dash = Provider.of<DashboardProvider>(context, listen: false);
        value.isProfileBack = true;
        dash.selectIndex = 1;
        dash.refreshData();
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          // Fallback to dashboard
          Navigator.pushNamedAndRemoveUntil(
            context,
            routeName.dashboard,
            (_) => false,
          );
        }
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LanguageProvider, ProfileProvider>(
      builder: (context1, languages, value, child) {
        final items = getMenuItems(context, title, value);
        final actions = getActions(context, value);

        return DirectionalityRtl(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              leadingWidth: 80,
              leading: CommonArrow(
                arrow: languages.isUserRTl
                    ? eSvgAssets.arrowRight
                    : eSvgAssets.arrowLeft,
                onTap: () {
                  final dash = Provider.of<DashboardProvider>(
                    context,
                    listen: false,
                  );
                  value.isProfileBack = false;
                  dash.selectIndex = 4;
                  route.pushNamedAndRemoveUntil(context, routeName.dashboard);
                },
              ).paddingAll(Insets.i8),
              title: Text(
                language(context, title),
                style: appCss.dmDenseBold18.textColor(
                  appColor(context).darkText,
                ),
              ),
            ),
            body: Container(
              decoration: ShapeDecoration(
                color: appColor(context).whiteColor,
                shadows: [
                  BoxShadow(
                    color: appColor(context).fieldCardBg,
                    spreadRadius: 2,
                    blurRadius: 4,
                  ),
                ],
                shape: SmoothRectangleBorder(
                  side: BorderSide(color: appColor(context).fieldCardBg),
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: AppRadius.r12,
                    cornerSmoothing: 1,
                  ),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: item.icon
                            .marginAll(Insets.i8)
                            .decorated(
                              shape: BoxShape.circle,
                              color: appColor(context).fieldCardBg,
                            ),
                        title: Text(
                          language(context, item.title),
                          style: appCss.dmDenseRegular14.textColor(
                            appColor(context).darkText,
                          ),
                        ),
                        trailing: SvgPicture.asset(
                          eSvgAssets.arrowRight,
                          color: appColor(context).lightText,
                        ),
                        onTap: () {
                          log("sdkjaskldajsdkla mmmmm ");
                          if (item.destination != null) {
                            log("sdkjaskldajsdkla ajay ");
                            route.push(context, item.destination!);
                          } else {
                            final titleKey = language(context, item.title);
                            actions[titleKey]?.call();
                            log("sdkjaskldajsdkla raju - - => $titleKey ");
                          }
                        },
                      ),
                      if (index < items.length - 1)
                        Divider(
                          color: appColor(context).fieldCardBg,
                          height: 0,
                        ),
                    ],
                  );
                },
              ),
            ).paddingAll(Sizes.s20),
          ),
        );
      },
    );
  }
}

class PageSlug {
  static const aboutUs = "aboutus";
  static const terms = "terms";
  static const cancellation = "cancellation";
  static const privacy = "privacy";
  static const emergency = "emergency";
  static const mayor = "mayor";

  // static const contactUs = "contactUs";
  // static const municipalityMessages = "municipalityMessages";
  //
  //
  //
  //
  // static const faq = "faq";
}
