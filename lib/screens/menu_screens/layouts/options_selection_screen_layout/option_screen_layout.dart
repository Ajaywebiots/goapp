import 'dart:developer';
import '../../../../config.dart';
import '../../../../models/app_model/MenuItem.dart';
import '../../../../widgets/DirectionalityRtl.dart';

class OptionScreenLayout extends StatelessWidget {
  final String? title;

  const OptionScreenLayout({super.key, this.title});

  List<MenuItem> getMenuItems(BuildContext context, String? title, value) {
    if (title == appFonts.businessClub) {
      return appArray.businessClubItems();
    } else if (title == appFonts.travelGuide) {
      return appArray.travelGuideItems();
    } else if (title == appFonts.salaminaMunicipality) {
      return appArray.municipalityItems();
    } else if (title == appFonts.myAccount) {
      return appArray.myAccountItems();
    } else if (title == appFonts.appDetails) {
      return appArray.appDetailsItems();
    } else if (title == appFonts.customerSupport) {
      return appArray.customerSupportItems(context);
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LanguageProvider, ProfileProvider>(
        builder: (context1, languages, value, child) {
      final items = getMenuItems(context, title, value);
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
                        final dash = Provider.of<DashboardProvider>(context,
                            listen: false);

                        value.isProfileBack == false;
                        log("DDDDDD:${dash.selectIndex = 4}");
                        route.pushNamedAndRemoveUntil(
                            context, routeName.dashboard);
                      }).paddingAll(Insets.i8),
                  title: Text(language(context, title),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText))),
              body: Container(
                  decoration: ShapeDecoration(
                      color: appColor(context).whiteColor,
                      shadows: [
                        BoxShadow(
                            color: appColor(context).fieldCardBg,
                            spreadRadius: 2,
                            blurRadius: 4)
                      ],
                      shape: SmoothRectangleBorder(
                          side:
                              BorderSide(color: appColor(context).fieldCardBg),
                          borderRadius: SmoothBorderRadius(
                              cornerRadius: AppRadius.r12,
                              cornerSmoothing: 1))),
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Column(children: [
                          ListTile(
                              leading: item.icon.marginAll(Insets.i8).decorated(
                                  shape: BoxShape.circle,
                                  color: appColor(context).fieldCardBg),
                              title: Text(language(context, item.title),
                                  style: appCss.dmDenseRegular14
                                      .textColor(appColor(context).darkText)),
                              trailing: SvgPicture.asset(eSvgAssets.arrowRight,
                                  color: appColor(context).lightText),
                              onTap: () {
                                log("message=-====-=-=-=-=-=-=${item.destination}");
                                if (item.destination != null) {
                                  route.push(context, item.destination!);
                                } else {
                                  final title = item.title;

                                  log("nzkfnzxd ${item.title}");
                                  final actions = <String, VoidCallback>{
                                    "About Us": () =>
                                        value.appPagesAPI(context, "ABOUTUS"),
                                    "The Mayor of Salamina": () =>
                                        value.appPagesAPI(context, "MAYOR"),
                                    "Contact Us": () {
                                      Provider.of<ContactUsProvider>(context,
                                              listen: false)
                                          .getSubjectData(context);
                                    },
                                    "Municipality Messages": () =>
                                        value.appPagesAPI(context, "MUNIMSG"),
                                    "Emergency Numbers": () =>
                                        value.appPagesAPI(context, "EMERGENCY"),
                                    "Business Listings": () {
                                      final dash =
                                          Provider.of<DashboardProvider>(
                                              context,
                                              listen: false);

                                      log("PROFILE::${value.isProfileBack}");
                                      value.isProfileBack = true;

                                      dash.selectIndex = 1;
                                      dash.refreshData();
                                      if (Navigator.of(context).canPop()) {
                                        Navigator.pop(context);
                                      }
                                    },
                                    "Travel Information": () => route.pushNamed(
                                        context, routeName.latestBlogViewAll),
                                    "Special Offers": () {
                                      final dash =
                                          Provider.of<DashboardProvider>(
                                              context,
                                              listen: false);
                                      log("PROFILE::${value.isProfileBack}");
                                      value.isProfileBack = true;
                                      dash.selectIndex = 2;
                                      dash.refreshData();
                                      route.pop(context);
                                      /*  route.pushNamedAndRemoveUntil(
                                          context, routeName.dashboard); */
                                    },
                                    "Explore Points of Interest": () {
                                      final dash =
                                          Provider.of<DashboardProvider>(
                                              context,
                                              listen: false);
                                      log("PROFILE::${value.isProfileBack}");
                                      value.isProfileBack = true;
                                      dash.selectIndex = 3;
                                      dash.refreshData();
                                      route.pop(context);
                                      /*  route.pushNamedAndRemoveUntil(
                                          context, routeName.dashboard); */
                                    },
                                    "Terms & Conditions": () =>
                                        value.appPagesAPI(context, "TERMS"),
                                    "Privacy Policy": () =>
                                        value.appPagesAPI(context, "PRIVACY"),
                                    "Cancellation Policy": () => value
                                        .appPagesAPI(context, "CANCELLATION"),
                                    "FAQ": () =>
                                        value.appPagesAPI(context, "FAQ"),
                                    "How to Join?": () => route.pushNamed(
                                        context,
                                        routeName.subscriptionPlanScreen),
                                  };

                                  actions[title]?.call();
                                }
                              }),
                          if (index < items.length - 1)
                            Divider(
                                color: appColor(context).fieldCardBg, height: 0)
                        ]);
                      })).paddingAll(Sizes.s20)));
    });
  }
}
