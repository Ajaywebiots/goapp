import 'dart:developer';
import 'package:goapp/screens/bottom_screens/home_screen/layouts/top_categories_layout.dart';
import '../../../../config.dart';
import '../../../../widgets/heading_row_common.dart';
import 'expert_business_layout.dart';
import 'featured_business_layout.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
                    onTap: () {
                      Provider.of<DashboardProvider>(context, listen: false)
                          .isInCategoryListing = true;
                      route.pushNamed(context, routeName.categoriesListScreen);
                    }).paddingSymmetric(horizontal: Insets.i20),
            value.categoryList.isEmpty
                ? SizedBox.shrink()
                : const VSpace(Sizes.s15),
            value.categoryList.isEmpty
                ? SizedBox.shrink()
                : Consumer<DashboardProvider>(builder: (context, sss, child) {
                    return Wrap(
                        alignment: WrapAlignment.center,
                        direction: Axis.horizontal,
                        children: value.categoryList
                            .toList()
                            .asMap()
                            .entries
                            .map((element) {
                          return TopCategoriesLayout(
                                  // isHomeScreen: true,
                                  onTap: () {
                                    setState(() {
                                      sss.selectIndex = 1;
                                      sss.notifyListeners();
                                      log("dash.selectIndex::${dash.selectIndex}");
                                    });
                                    final selectedCategory = element.value;
                                    final dashProvider =
                                        Provider.of<DashboardProvider>(context,
                                            listen: false);
                                    final searchProvider =
                                        Provider.of<SearchProvider>(context,
                                            listen: false);
                                    searchProvider.setPendingCategoryName(
                                        selectedCategory.translatedValue ?? '');
                                    sss.notifyListeners();
                                  },
                                  data: element.value,
                                  selectedIndex: value.cIndex,
                                  index: element.key)
                              .padding(
                                  bottom: Insets.i20,
                                  horizontal:
                                      MediaQuery.of(context).size.width / 35);
                        }).toList());
                  }),
            value.firstTwoFeaturedServiceList.isEmpty
                ? Container()
                : const VSpace(Sizes.s25),
            value.firstTwoFeaturedServiceList.isEmpty
                ? Container()
                : Consumer<DashboardProvider>(builder: (context, sss, child) {
                    return HeadingRowCommon(
                        title: appFonts.featuredService,
                        isTextSize: true,
                        onTap: () {
                          searchPvr.popular = true;
                          searchPvr.getBusinessSearchAPI(context);
                          sss.selectIndex = 1;
                          sss.notifyListeners();
                          // route.pushNamed(context, routeName.search);
                        }).paddingSymmetric(horizontal: Insets.i20);
                  }),
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
                            final previousFavourite = e.value.isFavourite;

                            e.value.isFavourite = !previousFavourite;

                            value.notifyListeners();
                            final common = Provider.of<CommonApiProvider>(
                                context,
                                listen: false);
                            common.toggleFavAPI(
                                onSuccess: () =>
                                    Provider.of<HomeScreenProvider>(context,
                                            listen: false)
                                        .homeFeed(context),
                                context,
                                previousFavourite,
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
                  Consumer<DashboardProvider>(builder: (context, sss, child) {
                    return HeadingRowCommon(
                        title: language(context, appFonts.pointOfInterests),
                        isTextSize: true,
                        onTap: () => {
                              sss.selectIndex = 3,
                              sss.notifyListeners()
                            } /*route.pushNamed(
                            context, routeName.attractionScreen)*/
                        );
                  }),
                  const VSpace(Sizes.s15),
                  ...value.firstTwoHighRateList
                      .asMap()
                      .entries
                      .map((e) => FeatureAttractionLayout(
                          data: e.value,
                          addOrRemoveTap: () {
                            final previousFavourite = e.value.isFavourite;

                            e.value.isFavourite = !previousFavourite;

                            value.notifyListeners();

                            final common = Provider.of<CommonApiProvider>(
                                context,
                                listen: false);

                            common.toggleFavAPI(
                                context,
                                previousFavourite,
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
