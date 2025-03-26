import '../../../config.dart';
import '../../../providers/app_pages_provider/categories_details_provider.dart';
import '../../../providers/app_pages_provider/categories_list_provider.dart';
import '../../../providers/app_pages_provider/search_provider.dart';
import '../../../providers/bottom_providers/cart_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
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
    return Consumer2<CategoriesDetailsProvider, CategoriesListProvider>(
        builder: (context1, cat, value1, child) {
      return Consumer<SearchProvider>(builder: (context1, value, child) {
        return Consumer<DashboardProvider>(builder: (context3, dash, child) {
          return StatefulWrapper(
              onInit: () =>
                  Future.delayed(const Duration(milliseconds: 100), () {
                    value.onAnimate(context, this);
                  }),
              child: PopScope(
                  canPop: true,
                  onPopInvoked: (didPop) => value.onBack(),
                  child: DirectionalityRtl(
                      child: Scaffold(
                          appBar: AppBarCommon(
                              title: appFonts.search,
                              onTap: () {
                                value.onBack();
                                route.pop(context);
                              }),
                          body: value.isSearch == true
                              ? SingleChildScrollView(child:
                                  Consumer<CartProvider>(
                                      builder: (context2, cart, child) {
                                  return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        SearchTextFieldCommon(
                                            focusNode: value.searchFocus,
                                            controller: value.searchCtrl,
                                            onChanged: (v) {
                                              if (v.isEmpty) {
                                                value.searchList = [];
                                                value.isSearch = v.length > 2;
                                                value.notifyListeners();
                                              }
                                            },
                                            onFieldSubmitted: (v) =>
                                                value.searchService(context),
                                            suffixIcon: FilterIconCommon(
                                                selectedFilter: value
                                                    .totalCountFilter()
                                                    .toString(),
                                                onTap: () => value
                                                    .onBottomSheet(context))),
                                        const VSpace(Sizes.s25),
                                        Text(appFonts.categories,
                                            style: appCss.dmDenseBold16
                                                .textColor(appColor(context)
                                                    .darkText)),
                                        SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(children: [
                                              GestureDetector(
                                                      onTap: () {},
                                                      child: Column(children: [
                                                        Container(
                                                            height: Sizes.s60,
                                                            width: Sizes.s60,
                                                            decoration: ShapeDecoration(
                                                                color: appColor(context)
                                                                    .fieldCardBg,
                                                                shape: SmoothRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: appColor(context)
                                                                            .trans),
                                                                    borderRadius: SmoothBorderRadius(
                                                                        cornerRadius: AppRadius
                                                                            .r10,
                                                                        cornerSmoothing:
                                                                            1))),
                                                            child: SvgPicture.asset(
                                                                    "assets/svg/all.svg",
                                                                    colorFilter: ColorFilter.mode(
                                                                        appColor(context)
                                                                            .darkText,
                                                                        BlendMode.srcIn),
                                                                    fit: BoxFit.fill,
                                                                    height: Sizes.s24,
                                                                    width: Sizes.s24)
                                                                .paddingAll(Insets.i17)),
                                                        VSpace(Insets.i8),
                                                        Text(appFonts.popular,
                                                            style: appCss
                                                                .dmDenseRegular13
                                                                .textColor(appColor(
                                                                        context)
                                                                    .darkText))
                                                      ]))
                                                  .paddingOnly(
                                                      right: Insets.i20),
                                              ...value1.categoryList
                                                  .asMap()
                                                  .entries
                                                  .map((e) => TopCategoriesLayout(
                                                          index: e.key,
                                                          data: e.value,
                                                          selectedIndex: cat
                                                              .selectedIndex,
                                                          onTap: () => cat
                                                              .onSubCategories(
                                                                  context,
                                                                  e.key,
                                                                  e.value.id))
                                                      .paddingOnly(
                                                          right: Insets.i20))
                                                  .toList()
                                            ]).padding(
                                                vertical: Insets.i15,
                                                left: Insets.i20)),
                                        const VSpace(Sizes.s15),
                                        value.searchList.isNotEmpty
                                            ? Column(
                                                children: value.searchList
                                                    .asMap()
                                                    .entries
                                                    .map((e) =>
                                                        FeaturedBusinessLayout(
                                                            data: e.value,
                                                            inCart: isInCart(
                                                                context,
                                                                e.value.id),
                                                            onTap: () {},
                                                            /*=> value.onTapFeatures(
                                                            context, e.value, e.key)*/

                                                            addTap: () {}
                                                            /*value.onFeatured(
                                                                    context, e.value, e.key,
                                                                    inCart: isInCart(
                                                                        context,
                                                                        e.value.id)) */
                                                            ))
                                                    .toList())
                                            : Column(
                                                children: value.recentSearchList
                                                    .asMap()
                                                    .entries
                                                    .map((e) =>
                                                        FeaturedBusinessLayout(
                                                            data: e.value,
                                                            inCart: isInCart(
                                                                context,
                                                                e.value.id),
                                                            onTap: () {
                                                              /*=>
                                                              value.onTapFeatures(
                                                                  context,
                                                                  e.value,
                                                                  e.key) */
                                                            },
                                                            addTap: () {}
                                                            /* =>
                                                              value.onFeatured(
                                                                  context, e.value,
                                                                  e.key,
                                                                  inCart: isInCart(
                                                                      context,
                                                                      e.value.id)) */
                                                            ))
                                                    .toList())
                                      ])
                                      .paddingSymmetric(horizontal: Insets.i20);
                                }))
                              : EmptyLayout(
                                  title: appFonts.noResultsWereFound,
                                  subtitle: language(context, appFonts.sorry),
                                  buttonText: appFonts.refresh,
                                  bTap: () => value.searchClear(),
                                  widget: Image.asset(eImageAssets.noNoti,
                                      height: Sizes.s200))))));
        });
      });
    });
  }
}
