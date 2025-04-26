import 'dart:developer';

import 'package:goapp/providers/app_pages_provider/attractions_provider.dart';
import 'package:goapp/providers/app_pages_provider/search_provider.dart';
import 'package:goapp/screens/app_pages_screen/search_screen/search_screen.dart';
import 'package:goapp/screens/bottom_screens/home_screen/layouts/top_categories_layout.dart';

import '../../../../config.dart';
import '../../../../providers/app_pages_provider/categories_list_provider.dart';
import '../../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../../providers/common_providers/common_api_provider.dart';
import '../../../../widgets/heading_row_common.dart';
import 'expert_business_layout.dart';
import 'featured_business_layout.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<SearchProvider, DashboardProvider, CategoriesListProvider>(
        builder: (context3, searchPvr, dash, catList, child) {
      return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
        final attraction =
            Provider.of<AttractionProvider>(context, listen: false);
        return Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            /*dash.categoryList.isEmpty
                ? Container()
                :*/
            value.categoryList.isEmpty
                ? SizedBox.shrink()
                : HeadingRowCommon(
                        title: appFonts.topCategories,
                        isTextSize: true,
                        onTap: () => route.pushNamed(
                            context, routeName.categoriesListScreen))
                    .paddingSymmetric(horizontal: Insets.i20),
            value.categoryList.isEmpty
                ? SizedBox.shrink()
                : const VSpace(Sizes.s15),
            value.categoryList.isEmpty
                ? SizedBox.shrink()
                : Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    children: value.categoryList
                        .take(8)
                        .toList()
                        .asMap()
                        .entries
                        .map((element) {
                      return TopCategoriesLayout(
                              isHomeScreen: true,
                              // onTap: () {
                              //   route.pushNamed(context, routeName.search);
                              //   search.onSubCategories(context, element.key,
                              //       element.value.categoryId);
                              // },
                              data: element.value,
                              selectedIndex: value.cIndex,
                              index: element.key)
                          .padding(
                              bottom: Insets.i20,
                              horizontal:
                                  MediaQuery.of(context).size.width / 35)
                          .inkWell(onTap: () {
                        final selectedCategory = element.value;
                        final selectedIndex = selectedCategory.categoryId;

                        log("selectedIndex ss ${selectedCategory.translatedValue}");
                        // Navigate to the second screen and pass data
                        log("value.categoryList::${selectedCategory.categoryId}");
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen(
                                        selectedIndex: selectedIndex! - 1)))
                            .then((value) {
                          searchPvr.onSubCategories(
                              context, element.key, element.value.categoryId!);
                        });
                      });
                    }).toList()),
            value.firstTwoFeaturedServiceList.isEmpty
                ? Container()
                : const VSpace(Sizes.s25),
            value.firstTwoFeaturedServiceList.isEmpty
                ? Container()
                : HeadingRowCommon(
                    title: appFonts.featuredService,
                    isTextSize: true,
                    onTap: () {
                      searchPvr.popular = true;
                      searchPvr.getBusinessSearchAPI(context);

                      route.pushNamed(context, routeName.search);
                    }).paddingSymmetric(horizontal: Insets.i20),
            value.firstTwoFeaturedServiceList.isEmpty
                ? Container()
                : const VSpace(Sizes.s15),
            if (value.firstTwoFeaturedServiceList.isNotEmpty)
              ...value.firstTwoFeaturedServiceList
                  .asMap()
                  .entries
                  .map((e) => value.firstTwoFeaturedServiceList.isEmpty
                      ? Container()
                      : FeaturedBusinessLayout(
                          data: e.value,
                          addOrRemoveTap: () {
                            final common = Provider.of<CommonApiProvider>(
                                context,
                                listen: false);
                            common.toggleFavAPI(
                                onSuccess: () =>
                                    Provider.of<HomeScreenProvider>(context,
                                            listen: false)
                                        .homeFeed(context),
                                context,
                                e.value.isFavourite,
                                e.value.appObject!.appObjectType,
                                e.value.appObject!.appObjectId);
                          },
                          onTap: () {
                            final searchPvr = Provider.of<SearchProvider>(
                                context,
                                listen: false);
                            searchPvr.notifyListeners();
                            searchPvr.businessDetailsAPI(context, e.value.id);
                          }).paddingSymmetric(horizontal: Insets.i20))
          ]),
          value.firstTwoHighRateList.isEmpty
              ? Container()
              : Column(children: [
                  HeadingRowCommon(
                      title: language(context, appFonts.pointOfInterests),
                      isTextSize: true,
                      onTap: () =>
                          route.pushNamed(context, routeName.attractionScreen)),
                  const VSpace(Sizes.s15),
                  ...value.firstTwoHighRateList
                      .asMap()
                      .entries
                      .map((e) => FeatureAttractionLayout(
                          data: e.value,
                          addOrRemoveTap: () {
                            final common = Provider.of<CommonApiProvider>(
                                context,
                                listen: false);
                            common.toggleFavAPI(
                                context,
                                e.value.isFavourite,
                                e.value.appObject!.appObjectType,
                                e.value.appObject!.appObjectId, onSuccess: () {
                              attraction.getAttractionSearchAPI(context);
                              Provider.of<HomeScreenProvider>(context,
                                      listen: false)
                                  .homeFeed(context);
                              attraction.attractionsDetailsAPI(
                                  context, e.value.id,
                                  isNotRoute: true);
                            });
                          },
                          onTap: () {
                            attraction.attractionsDetailsAPI(
                                context, e.value.id);
                          }))
                ])
                  .padding(horizontal: Insets.i20, vertical: Insets.i25)
                  .backgroundColor(appColor(context).fieldCardBg)
        ]);
      });
    });
  }
}
