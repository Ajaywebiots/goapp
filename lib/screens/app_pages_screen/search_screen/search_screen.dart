import 'dart:developer';
import 'package:goapp/config.dart';
import 'package:goapp/models/api_model/business_category_model.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';
import 'package:goapp/widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/featured_business_layout.dart';
import '../../bottom_screens/home_screen/layouts/top_categories_layout.dart';
import '../../menu_screens/layouts/options_selection_screen_layout/option_screen_layout.dart';

class SearchScreen extends StatefulWidget {
  final bool isHomeScreen;
  final int? selectedIndex;
  final List<Categories>? categoryList;

  const SearchScreen(
      {super.key,
      this.isHomeScreen = false,
      this.selectedIndex,
      this.categoryList});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  int? selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedCategoryIndex = widget.selectedIndex;

    final categoryListPvr =
        Provider.of<CategoriesListProvider>(context, listen: false);
    final searchPvr = Provider.of<SearchProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Optional: Find matching index by comparing translatedValue if needed.
      /*final matchedIndex = categoryListPvr.categoryList.indexWhere((cat) =>
          cat.translatedValue?.trim().toLowerCase() ==
          categoryListPvr
              .categoryList[selectedCategoryIndex ?? 0].translatedValue
              ?.trim()
              .toLowerCase());*/

      final pendingName = searchPvr.pendingCategoryName;
      if (pendingName != null) {
        final matchedIndex = categoryListPvr.categoryList.indexWhere(
            (cat) => cat.translatedValue?.trim().toLowerCase() == pendingName);

        if (matchedIndex != -1) {
          final matchedCategory = categoryListPvr.categoryList[matchedIndex];
          searchPvr.onSubCategories(
              context, matchedIndex, matchedCategory.categoryId);

          setState(() {
            selectedCategoryIndex = matchedIndex;
          });

          _scrollController.animateTo(matchedIndex * 80.0,
              duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<ProfileProvider, CategoriesListProvider, SearchProvider>(
        builder: (context1, value, categoryListPvr, searchPvr, child) {
      // final args = ModalRoute.of(context)?.settings.arguments as Categories?;
      // final selectedIndex = (args?.categoryId ?? 1) - 1;

      // log(" SSSSSS:${searchPvr.selectedIndex}");
      // log(" SSSSSS:${categoryListPvr.categoryList[searchPvr.selectedIndex].translatedValue}");
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 100), () {
                searchPvr.onAnimate(context);
                // categoryListPvr.onReady(context);
                // searchPvr.onReady();
              }),
          child: PopScope(
              canPop: true,
              onPopInvokedWithResult: (didPop, result) =>
                  searchPvr.onBack(context),
              child: DirectionalityRtl(
                  child: Scaffold(
                      appBar: AppBarCommon(
                          title: language(context, appFonts.businessListings),
                          onTap: () {
                            final dashPvr = Provider.of<DashboardProvider>(
                                context,
                                listen: false);
                            final pro = Provider.of<ProfileProvider>(context,
                                listen: false);
                            log("pro.isProfileBack==true::${pro.isProfileBack == true}");
                            if (pro.isProfileBack == true) {
                              log("is back aaaaaa");
                              pro.isProfileBack = false;
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return OptionScreenLayout(
                                    title: "Business Club");
                              }));
                              pro.notifyListeners();
                            } else {
                              dashPvr.selectIndex = 0;
                              /*  route.pop(context); */
                            }
                            // searchPvr.onBack(context);
                            if (widget.isHomeScreen == true) {
                              dashPvr.selectIndex = 0;

                              dashPvr.notifyListeners();
                            } else {
                              log("dddd vvv");
                              searchPvr.popular = true;
                              searchPvr.isPopularSelected = false;

                              route.pop(context);
                              dashPvr.notifyListeners();
                            }
                          }),
                      body: SingleChildScrollView(
                          controller: _scrollController,
                          child: Stack(children: [
                            SafeArea(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  SearchTextFieldCommon(
                                      hintText: language(context, appFonts.searchBusiness),
                                      focusNode: searchPvr.searchFocus,
                                      controller: searchPvr.searchCtrl,
                                      onChanged: (v) {
                                        searchPvr.onSearchChange(
                                            context, searchPvr.selectIndex,
                                            isPopular: searchPvr.popular);
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
                                      style: appCss.dmDenseBold16.textColor(
                                          appColor(context).darkText)),
                                  SingleChildScrollView(
                                      controller: _scrollController,
                                      scrollDirection: Axis.horizontal,
                                      child: Row(children: [
                                        searchPvr.isPopularSelected == false
                                            ? GestureDetector(
                                                    onTap: () {
                                                      searchPvr.popular = true;
                                                      searchPvr
                                                          .notifyListeners();
                                                      searchPvr
                                                          .getBusinessSearchAPI(
                                                              context);
                                                      searchPvr
                                                          .notifyListeners();
                                                    },
                                                    child: Column(children: [
                                                      Container(
                                                          height: Sizes.s60,
                                                          width: Sizes.s60,
                                                          decoration: ShapeDecoration(
                                                              color: searchPvr.popular
                                                                  ? appColor(context)
                                                                      .primary
                                                                      .withValues(
                                                                          alpha:
                                                                              0.2)
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
                                                                      cornerRadius: AppRadius
                                                                          .r10,
                                                                      cornerSmoothing:
                                                                          1))),
                                                          child: SvgPicture.asset(
                                                                  "assets/svg/all.svg",
                                                                  colorFilter: ColorFilter.mode(appColor(context).darkText, BlendMode.srcIn),
                                                                  fit: BoxFit.fill,
                                                                  height: Sizes.s24,
                                                                  width: Sizes.s24)
                                                              .paddingAll(Insets.i15)),
                                                      VSpace(Insets.i8),
                                                      Text(
                                                          language(context,
                                                              appFonts.popular),
                                                          style: appCss
                                                              .dmDenseRegular13
                                                              .textColor(searchPvr.popular
                                                                  ? appColor(
                                                                          context)
                                                                      .primary
                                                                  : appColor(
                                                                          context)
                                                                      .darkText))
                                                    ]))
                                                .paddingOnly(
                                                    right: Insets.i20,
                                                    left: Insets.i2)
                                            : Container(),
                                        ...categoryListPvr.categoryList
                                            .asMap()
                                            .entries
                                            .map((e) {
                                          return TopCategoriesLayout(
                                                  index: e.key,
                                                  data: e.value,
                                                  selectedIndex:
                                                      selectedCategoryIndex,
                                                  onTap: () {
                                                    setState(() {
                                                      selectedCategoryIndex =
                                                          e.key;
                                                    });
                                                    searchPvr.onSubCategories(
                                                        context,
                                                        e.key,
                                                        e.value.categoryId);
                                                  })
                                              .marginOnly(
                                                  left: e.key == 0 ? 0 : 7,
                                                  right: 7);
                                        })
                                      ]).padding(
                                          top: Insets.i15,
                                          bottom: searchPvr
                                                  .businessSearchList.isEmpty
                                              ? 0
                                              : 15)),
                                  searchPvr.businessSearchList.isEmpty
                                      ? VSpace(Insets.i1)
                                      : const VSpace(Sizes.s10),
                                  searchPvr.businessSearchList.isEmpty
                                      ? EmptyLayout(
                                          topHeight: 40,
                                          isButtonShow: false,
                                          title: language(context,
                                              appFonts.noResultsWereFound),
                                          subtitle:
                                              language(context, appFonts.sorry),
                                          widget: Image.asset(
                                              eImageAssets.noNoti,
                                              height: Sizes.s200))
                                      : Column(
                                          children: searchPvr.businessSearchList
                                              .asMap()
                                              .entries
                                              .map(
                                                  (e) => FeaturedBusinessLayout(
                                                      addOrRemoveTap: () {
                                                        final previousFavourite =
                                                            e.value.isFavourite;
                                                        e.value.isFavourite =
                                                            !previousFavourite;
                                                        searchPvr
                                                            .notifyListeners();
                                                        final common = Provider
                                                            .of<CommonApiProvider>(
                                                                context,
                                                                listen: false);
                                                        final home = Provider
                                                            .of<HomeScreenProvider>(
                                                                context,
                                                                listen: false);
                                                        final search = Provider
                                                            .of<SearchProvider>(
                                                                context,
                                                                listen: false);

                                                        common.toggleFavAPI(
                                                            context,
                                                            e.value.isFavourite,
                                                            e.value.appObject!
                                                                .appObjectType,
                                                            e.value.appObject!
                                                                .appObjectId,
                                                            onSuccess: () {
                                                          search
                                                              .businessDetailsAPI(
                                                                  context,
                                                                  e.value.id,
                                                                  isNotRouting:
                                                                      true);
                                                          search.getBusinessSearchAPI(
                                                              context,
                                                              id: categoryListPvr
                                                                  .categoryList[
                                                                      selectedCategoryIndex ==
                                                                              null
                                                                          ? 0
                                                                          : selectedCategoryIndex!]
                                                                  .categoryId,
                                                              isFilter:
                                                                  searchPvr.popular ==
                                                                          true
                                                                      ? false
                                                                      : true);
                                                          home.homeFeed(
                                                              context);
                                                          log("jjdjdjd");
                                                        });
                                                      },
                                                      data: e.value,
                                                      onTap: () {
                                                        searchPvr
                                                            .businessDetailsAPI(
                                                                context,
                                                                e.value.id);
                                                      }))
                                              .toList())
                                ]).paddingSymmetric(horizontal: Insets.i20)),
                            if (searchPvr.isLoading)
                              Container(
                                  color: isDark(context)
                                      ? Colors.black.withOpacity(0.3)
                                      : appColor(context)
                                          .darkText
                                          .withOpacity(0.2),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Center(
                                      child: Image.asset(eGifAssets.loader,
                                          height: Sizes.s100)))
                          ]))))));
    });
  }
}
