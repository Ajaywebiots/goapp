import 'dart:developer';

import 'package:goapp/common/languages/app_language.dart';
import 'package:goapp/common_tap.dart';
import 'package:goapp/screens/bottom_screens/home_screen/layouts/service_package_layout.dart';
import 'package:goapp/screens/bottom_screens/home_screen/layouts/top_categories_layout.dart';

import '../../../../config.dart';
import '../../../../providers/bottom_providers/cart_provider.dart';
import '../../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../../widgets/heading_row_common.dart';
import 'expert_service_layout.dart';
import 'featured_service_layout.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context3, dash, child) {
      return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
        return Consumer<CartProvider>(builder: (context2, cart, child) {
          return Column(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              HeadingRowCommon(
                      title: appFonts.topCategories,
                      isTextSize: true,
                      onTap: () {})
                  .paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s15),
              Wrap(
                direction: Axis.horizontal,
                children:
                    dash.categoryList.toList().asMap().entries.map((element) {
                  return TopCategoriesLayout(
                          data: element.value,
                          selectedIndex: value.cIndex,
                          index: element.key)
                      .paddingOnly(
                          bottom: Insets.i20,
                          right: MediaQuery.of(context).size.width / 24)
                      .inkWell(onTap: () {
                    log("DATA PASS : ${element.value}");
                  });
                }).toList(),
              ).width(MediaQuery.of(context).size.width).paddingOnly(
                  left: rtl(context) ? 0 : Insets.i27,
                  right: rtl(context) ? Insets.i27 : 0),
              const VSpace(Sizes.s25),
              HeadingRowCommon(
                      title: appFonts.featuredService,
                      isTextSize: true,
                      onTap: () {})
                  .paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s15),
              if (dash.firstTwoFeaturedServiceList.isNotEmpty)
                ...dash.firstTwoFeaturedServiceList.asMap().entries.map((e) =>
                    FeaturedServicesLayout(
                            data: e.value,
                            addTap: () => dash.onFeatured(
                                context, e.value, e.key,
                                inCart: isInCart(context, e.value.id)),
                            inCart: isInCart(context, e.value.id),
                            onTap: () {})
                        .paddingSymmetric(horizontal: Insets.i20)),
              if (dash.firstTwoFeaturedServiceList.isEmpty)
                ...dash.featuredServiceList.asMap().entries.map((e) =>
                    FeaturedServicesLayout(
                            data: e.value,
                            inCart: isInCart(context, e.value.id),
                            addTap: () => dash.onFeatured(
                                context, e.value, e.key,
                                inCart: isInCart(context, e.value.id)),
                            onTap: () {})
                        .paddingSymmetric(horizontal: Insets.i20))
            ]).padding(bottom: Insets.i10),
            if (dash.firstTwoHighRateList.isNotEmpty ||
                dash.highestRateList.isNotEmpty)
              Column(children: [
                HeadingRowCommon(
                    title: appFonts.expertService,
                    isTextSize: true,
                    onTap: () {}),
                const VSpace(Sizes.s15),
                if (dash.firstTwoHighRateList.isNotEmpty)
                  ...dash.firstTwoHighRateList.asMap().entries.map(
                      (e) => ExpertServiceLayout(data: e.value, onTap: () {})),
                if (dash.firstTwoHighRateList.isEmpty)
                  ...dash.highestRateList.asMap().entries.map(
                      (e) => ExpertServiceLayout(data: e.value, onTap: () {}))
              ])
                  .paddingSymmetric(
                      horizontal: Insets.i20, vertical: Insets.i25)
                  .backgroundColor(appColor(context).fieldCardBg)
          ]);
        });
      });
    });
  }
}
