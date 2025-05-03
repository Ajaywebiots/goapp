import 'dart:developer';

import 'package:goapp/providers/bottom_providers/dashboard_provider.dart';

import '../../../../config.dart';
import '../../../../models/app_model/MenuItem.dart';
import '../../../../providers/bottom_providers/profile_provider.dart';
import '../../../../widgets/DirectionalityRtl.dart';

class OptionScreenLayout extends StatelessWidget {
  final String? title;

  const OptionScreenLayout({super.key, this.title});

  List<MenuItem> getMenuItems(BuildContext context, String? title, value) {
    switch (title) {
      case 'Business Club':
        return appArray.businessClubItems();
      case 'Travel Guide':
        return appArray.travelGuideItems();
      case 'Salamina Municipality':
        return appArray.municipalityItems();
      case 'My Account':
        return appArray.myAccountItems();
      case 'App Details':
        return appArray.appDetailsItems();
      case 'Customer Support':
        return appArray.customerSupportItems(context);
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LanguageProvider, ProfileProvider>(
        builder: (context1, languageCtrl, value, child) {
      final items = getMenuItems(context, title, value);
      return LoadingComponent(
          child: DirectionalityRtl(
              child: Scaffold(
                  appBar: AppBar(
                      elevation: 0,
                      centerTitle: true,
                      leadingWidth: 80,
                      leading: CommonArrow(
                        arrow: languageCtrl.getLocal() == "ar" ||
                                languageCtrl.getLocal() == "el"
                            ? eSvgAssets.arrowRight
                            : eSvgAssets.arrowLeft,
                        onTap: () => route.pop(context),
                      ).paddingAll(Insets.i8),
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
                              side: BorderSide(
                                  color: appColor(context).fieldCardBg),
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
                                  leading: item.icon
                                      .marginAll(Insets.i8)
                                      .decorated(
                                          shape: BoxShape.circle,
                                          color: appColor(context).fieldCardBg),
                                  title: Text(item.title,
                                      style: appCss.dmDenseRegular14.textColor(
                                          appColor(context).darkText)),
                                  trailing: SvgPicture.asset(
                                      eSvgAssets.arrowRight,
                                      color: appColor(context).lightText),
                                  onTap: () {
                                    // Navigate to the destination if available
                                    if (item.destination != null) {
                                      route.push(context, item.destination!);
                                    } else {
                                      final title = item.title;
                                      if (title == "About Us") {
                                        value.appPagesAPI(context, "ABOUTUS");
                                      } else if (title == "Business Listings") {
                                        final dash =
                                            Provider.of<DashboardProvider>(
                                                context,
                                                listen: false);
                                        dash.selectIndex = 1;
                                        route.pushNamedAndRemoveUntil(
                                            context, routeName.dashboard);
                                      } else if (title == "Special Offers") {
                                        final dash =
                                            Provider.of<DashboardProvider>(
                                                context,
                                                listen: false);
                                        dash.selectIndex = 2;
                                        route.pushNamedAndRemoveUntil(
                                            context, routeName.dashboard);
                                      } else if (title ==
                                          "Explore Points of Interest") {
                                        final dash =
                                            Provider.of<DashboardProvider>(
                                                context,
                                                listen: false);
                                        dash.selectIndex = 3;
                                        route.pushNamedAndRemoveUntil(
                                            context, routeName.dashboard);
                                      } else if (title ==
                                          "Terms & Conditions") {
                                        value.appPagesAPI(context, "TERMS");
                                      } else if (title == "Privacy Policy") {
                                        value.appPagesAPI(context, "PRIVACY");
                                      } else if (title ==
                                          "Cancellation Policy") {
                                        value.appPagesAPI(
                                            context, "CANCELLATION");
                                      } else if (title == "FAQ") {
                                        value.appPagesAPI(context, "FAQ");
                                      }
                                    }
                                  }),
                              if (index < items.length - 1)
                                Divider(
                                    color: appColor(context).fieldCardBg,
                                    height: 0)
                            ]);
                          })).paddingAll(Sizes.s20))));
    });
  }
}
