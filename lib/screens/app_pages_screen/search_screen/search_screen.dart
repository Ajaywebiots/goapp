import 'dart:developer';
import 'package:goapp/config.dart';
import 'package:goapp/providers/app_pages_provider/categories_list_provider.dart';
import 'package:goapp/providers/app_pages_provider/search_provider.dart';
import 'package:goapp/providers/bottom_providers/cart_provider.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';
import 'package:goapp/widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/featured_business_layout.dart';
import '../../bottom_screens/home_screen/layouts/top_categories_layout.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoriesListProvider, SearchProvider>(
        builder: (context1, categoryListPvr, searchPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 100), () {
                searchPvr.onAnimate(context);
                categoryListPvr.onReady(context);
              }),
          child: PopScope(
              canPop: true,
              onPopInvoked: (didPop) => searchPvr.onBack(),
              child: DirectionalityRtl(
                  child: Scaffold(
                      appBar: AppBarCommon(
                          title: language(context, appFonts.search),
                          onTap: () {
                            searchPvr.onBack();
                            route.pop(context);
                          }),
                      body: SingleChildScrollView(child: Consumer<CartProvider>(
                          builder: (context2, cart, child) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SearchTextFieldCommon(
                                  focusNode: searchPvr.searchFocus,
                                  controller: searchPvr.searchCtrl,
                                  onChanged: (v) {
                                    if (v.isEmpty) {
                                      searchPvr.searchList = [];
                                      searchPvr.isSearch = v.length > 2;
                                      searchPvr.notifyListeners();
                                    }
                                  },
                                  onFieldSubmitted: (v) =>
                                      searchPvr.searchService(context),
                                  suffixIcon: FilterIconCommon(
                                      selectedFilter: searchPvr
                                          .totalCountFilter()
                                          .toString(),
                                      onTap: () => searchPvr.onBottomSheet(
                                          context, categoryListPvr))),
                              const VSpace(Sizes.s25),
                              Text(language(context, appFonts.categories),
                                  style: appCss.dmDenseBold16
                                      .textColor(appColor(context).darkText)),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(children: [
                                    GestureDetector(
                                        onTap: () {
                                          searchPvr.popular = true;
                                          searchPvr
                                              .getBusinessSearchAPI(context);
                                          searchPvr.notifyListeners();
                                        },
                                        child: Column(children: [
                                          Container(
                                              height: Sizes.s60,
                                              width: Sizes.s60,
                                              decoration: ShapeDecoration(
                                                  color: searchPvr.popular
                                                      ? appColor(context)
                                                          .primary
                                                          .withOpacity(0.2)
                                                      : appColor(context)
                                                          .fieldCardBg,
                                                  shape: SmoothRectangleBorder(
                                                      side: BorderSide(
                                                          color: searchPvr.popular
                                                              ? appColor(context)
                                                                  .primary
                                                              : appColor(context)
                                                                  .trans),
                                                      borderRadius: SmoothBorderRadius(
                                                          cornerRadius:
                                                              AppRadius.r10,
                                                          cornerSmoothing: 1))),
                                              child: SvgPicture.asset(
                                                      "assets/svg/all.svg",
                                                      colorFilter: ColorFilter.mode(
                                                          appColor(context).darkText, BlendMode.srcIn),
                                                      fit: BoxFit.fill,
                                                      height: Sizes.s24,
                                                      width: Sizes.s24)
                                                  .paddingAll(Insets.i17)),
                                          VSpace(Insets.i8),
                                          Text(
                                              language(
                                                  context, appFonts.popular),
                                              style: appCss.dmDenseRegular13
                                                  .textColor(searchPvr.popular
                                                      ? appColor(context)
                                                          .primary
                                                      : appColor(context)
                                                          .darkText))
                                        ])).paddingOnly(right: Insets.i20),
                                    ...searchPvr.categoryList
                                        .asMap()
                                        .entries
                                        .map((e) => TopCategoriesLayout(
                                                index: e.key,
                                                data: e.value,
                                                selectedIndex:
                                                    searchPvr.selectedIndex,
                                                onTap: () =>
                                                    searchPvr.onSubCategories(
                                                        context,
                                                        e.key,
                                                        e.value.categoryId))
                                            .paddingOnly(right: Insets.i20))
                                  ]).padding(
                                      vertical: Insets.i15, left: Insets.i20)),
                              const VSpace(Sizes.s15),
                              /*dash.categoryList.isNotEmpty
                                  ?*/
                              searchPvr.businessSearchList.isEmpty ||
                                      searchPvr.businessSearchList == []
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                          Center(
                                              child: Text("No Data Found",
                                                  style: appCss.dmDenseRegular12
                                                      .textColor(
                                                          appColor(context)
                                                              .darkText)))
                                        ])
                                  : Column(
                                      children: searchPvr.businessSearchList
                                          .asMap()
                                          .entries
                                          .map((e) => FeaturedBusinessLayout(
                                                data: e.value,
                                                // inCart: isInCart(
                                                //     context, e.value.id),
                                                onTap: () {
                                                  searchPvr.businessDetailsAPI(
                                                      context, e.value.id);
                                                },
                                                /*=> value.onTapFeatures(
                                                  context, e.value, e.key)*/
                                                /*value.onFeatured(
                                                          context, e.value, e.key,
                                                          inCart: isInCart(
                                                              context,
                                                              e.value.id)) */
                                              ))
                                          .toList())

                              /*: Column(
                                      children: value.recentSearchList
                                          .asMap()
                                          .entries
                                          .map((e) => FeaturedBusinessLayout(
                                              data: e.value,
                                              inCart: isInCart(context, e.value.id),
                                              onTap: () {
                                                */ /*=>
                                                    value.onTapFeatures(
                                                        context,
                                                        e.value,
                                                        e.key) */ /*
                                              },
                                              addTap: () {}
                                              */ /* =>
                                                    value.onFeatured(
                                                        context, e.value,
                                                        e.key,
                                                        inCart: isInCart(
                                                            context,
                                                            e.value.id)) */ /*
                                              ))
                                          .toList())*/
                            ]).paddingSymmetric(horizontal: Insets.i20);
                      }))
                      /*: EmptyLayout(
                              title: language(
                                  context, appFonts.noResultsWereFound),
                              subtitle: language(context, appFonts.sorry),
                              buttonText:
                                  language(context, appFonts.refresh),
                              bTap: () => value.searchClear(),
                              widget: Image.asset(eImageAssets.noNoti,
                                  height: Sizes.s200))*/
                      ))));
    });
  }
}
