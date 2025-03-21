import 'dart:developer';
import 'package:goapp/screens/bottom_screens/home_screen/layouts/top_categories_layout.dart';
import '../../../../config.dart';
import '../../../../providers/bottom_providers/cart_provider.dart';
import '../../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../../providers/bottom_providers/home_screen_provider.dart';
import '../../../../widgets/heading_row_common.dart';
import 'expert_business_layout.dart';
import 'featured_business_layout.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context3, dash, child) {
      return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
        return Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            HeadingRowCommon(
                    title: appFonts.topCategories,
                    isTextSize: true,
                    onTap: () => route.pushNamed(
                        context, routeName.categoriesListScreen))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                children: dash.categoryList
                    .take(8)
                    .toList()
                    .asMap()
                    .entries
                    .map((element) {
                  return TopCategoriesLayout(
                          data: element.value,
                          selectedIndex: value.cIndex,
                          index: element.key)
                      .padding(
                          bottom: Insets.i20,
                          horizontal: MediaQuery.of(context).size.width / 35)
                      .inkWell(onTap: () {
                    route.pushNamed(context, routeName.categoriesDetailsScreen);
                    log("DATA PASS : ${element.value}");
                  });
                }).toList()),
            const VSpace(Sizes.s25),
            HeadingRowCommon(
                    title: appFonts.featuredService,
                    isTextSize: true,
                    onTap: () => route.pushNamed(
                        context, routeName.featuredBusinessScreen))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            if (dash.firstTwoFeaturedServiceList.isNotEmpty)
              ...dash.firstTwoFeaturedServiceList.asMap().entries.map((e) =>
                  FeaturedBusinessLayout(
                          data: e.value,
                          addTap: () => dash.onFeatured(context, e.value, e.key,
                              inCart: isInCart(context, e.value.id)),
                          inCart: isInCart(context, e.value.id),
                          onTap: () => route.pushNamed(
                              context, routeName.businessDetailsScreen))
                      .paddingSymmetric(horizontal: Insets.i20)),
            if (dash.firstTwoFeaturedServiceList.isEmpty)
              ...dash.featuredServiceList.asMap().entries.map((e) =>
                  FeaturedBusinessLayout(
                          data: e.value,
                          inCart: isInCart(context, e.value.id),
                          addTap: () => dash.onFeatured(context, e.value, e.key,
                              inCart: isInCart(context, e.value.id)),
                          onTap: () => route.pushNamed(
                              context, routeName.businessDetailsScreen))
                      .paddingSymmetric(horizontal: Insets.i20))
          ]).padding(bottom: Insets.i40),
          if (dash.firstTwoHighRateList.isNotEmpty ||
              dash.highestRateList.isNotEmpty)
            Column(children: [
              HeadingRowCommon(
                  title: appFonts.pointOfInterests,
                  isTextSize: true,
                  onTap: () =>
                      route.pushNamed(context, routeName.expertServiceScreen)),
              const VSpace(Sizes.s15),
              if (dash.firstTwoHighRateList.isNotEmpty)
                ...dash.firstTwoHighRateList.asMap().entries.map((e) =>
                    FeatureAttractionLayout(
                        data: e.value,
                        onTap: () => route.pushNamed(
                            context, routeName.attractionDetailScreen))),
              if (dash.firstTwoHighRateList.isEmpty)
                ...dash.highestRateList.asMap().entries.map((e) =>
                    FeatureAttractionLayout(
                        data: e.value,
                        onTap: () => route.pushNamed(
                            context, routeName.attractionDetailScreen)))
            ])
                .padding(horizontal: Insets.i20, vertical: Insets.i25)
                .backgroundColor(appColor(context).fieldCardBg)
        ]);
      });
    });
  }
}
