import 'dart:developer';

import 'package:goapp/providers/app_pages_provider/search_provider.dart';
import 'package:goapp/screens/bottom_screens/home_screen/layouts/top_categories_layout.dart';

import '../../../../config.dart';
import '../../../../providers/app_pages_provider/categories_list_provider.dart';
import '../../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../../widgets/heading_row_common.dart';
import 'expert_business_layout.dart';
import 'featured_business_layout.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<DashboardProvider, CategoriesListProvider>(
        builder: (context3, dash, catList, child) {
      return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
        return Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            /*dash.categoryList.isEmpty
                ? Container()
                :*/
            dash.categoryList.isEmpty
                ? SizedBox.shrink()
                : HeadingRowCommon(
                        title: appFonts.topCategories,
                        isTextSize: true,
                        onTap: () => route.pushNamed(
                            context, routeName.categoriesListScreen))
                    .paddingSymmetric(horizontal: Insets.i20),
            dash.categoryList.isEmpty
                ? SizedBox.shrink()
                : const VSpace(Sizes.s15),
            dash.categoryList.isEmpty
                ? SizedBox.shrink()
                : Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    children: dash.categoryList
                        .take(8)
                        .toList()
                        .asMap()
                        .entries
                        .map((element) {
                      return TopCategoriesLayout(
                              isHomeScreen: true,
                              data: element.value,
                              selectedIndex: value.cIndex,
                              index: element.key)
                          .padding(
                              bottom: Insets.i20,
                              horizontal:
                                  MediaQuery.of(context).size.width / 35)
                          .inkWell(onTap: () {
                        route.pushNamed(
                            context, routeName.categoriesDetailsScreen);
                        log("DATA PASS : ${element.value}");
                      });
                    }).toList()),
            dash.firstTwoFeaturedServiceList.isEmpty
                ? Container()
                : const VSpace(Sizes.s25),
            dash.firstTwoFeaturedServiceList.isEmpty
                ? Container()
                : HeadingRowCommon(
                        title: appFonts.featuredService,
                        isTextSize: true,
                        onTap: () => route.pushNamed(context, routeName.search))
                    .paddingSymmetric(horizontal: Insets.i20),
            dash.firstTwoFeaturedServiceList.isEmpty
                ? Container()
                : const VSpace(Sizes.s15),
            if (dash.firstTwoFeaturedServiceList.isNotEmpty)
              ...dash.firstTwoFeaturedServiceList
                  .asMap()
                  .entries
                  .map((e) => dash.firstTwoFeaturedServiceList.isEmpty
                      ? Container()
                      : FeaturedBusinessLayout(
                          data: e.value,
                          inCart: isInCart(context, e.value.id),
                          onTap: () {
                            final searchPvr = Provider.of<SearchProvider>(
                                context,
                                listen: false);
                            searchPvr.businessDetailsAPI(context, e.value.id);
                          }).paddingSymmetric(horizontal: Insets.i20)),
          ]),
          dash.firstTwoHighRateList.isEmpty
              ? Container()
              : Column(children: [
                  HeadingRowCommon(
                      title: appFonts.pointOfInterests,
                      isTextSize: true,
                      onTap: () =>
                          route.pushNamed(context, routeName.attractionScreen)),
                  const VSpace(Sizes.s15),
                  // if (dash.firstTwoHighRateList.isNotEmpty)
                  ...dash.firstTwoHighRateList.asMap().entries.map((e) =>
                      FeatureAttractionLayout(
                          data: e.value,
                          onTap: () => route.pushNamed(
                              context, routeName.attractionDetailScreen))),
                  // if (dash.firstTwoHighRateList.isEmpty)
                  //   ...dash.highestRateList.asMap().entries.map((e) =>
                  //       FeatureAttractionLayout(
                  //           data: e.value,
                  //           onTap: () => route.pushNamed(
                  //               context, routeName.attractionDetailScreen)))
                ])
                  .padding(horizontal: Insets.i20, vertical: Insets.i25)
                  .backgroundColor(appColor(context).fieldCardBg)
        ]);
      });
    });
  }
}
