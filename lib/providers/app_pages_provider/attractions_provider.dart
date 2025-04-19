import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:goapp/models/api_model/attractions_details_model.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';
import 'package:goapp/providers/bottom_providers/offer_provider.dart';

import '../../config.dart';
import '../../models/api_model/attraction_categories_model.dart';
import '../../models/api_model/attractions_search_model.dart';
import '../../models/provider_model.dart';
import '../../screens/app_pages_screen/search_screen/filter_tap_layout.dart';
import '../../screens/app_pages_screen/search_screen/layouts/filter_layout.dart';
import '../../screens/app_pages_screen/search_screen/layouts/list_tile_common.dart';
import '../../screens/app_pages_screen/search_screen/layouts/second_filter.dart';
import '../../services/api_service.dart';
import '../bottom_providers/dashboard_provider.dart';

class AttractionProvider with ChangeNotifier {
  final FocusNode searchFocus = FocusNode();

  List<ProviderModel> searchList = [];
  AnimationController? animationController;
  TextEditingController txtFeaturedSearch = TextEditingController();

  onReady(context) async {
    log("lllllll");

    notifyListeners();
    getCategoriesData(context);
    notifyListeners();
  }

  List categoryList = [];

  List attractionsSearchList = [];

  bool isLoading = false;

  getAttractionSearchAPI(context) async {
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    notifyListeners();
    isLoading = true;
    Position position = await homePvr.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;

    try {
      log("hello  kjhdfjkdfjsd  sssss ");
      apiServices
          .commonApi(
              "${api.attractionSearch}?currentLongitude=$lon&currentLatitude=$lat",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        log("value.data ${value.data}");
        if (value.data['responseStatus'] == 1) {
          notifyListeners();
          isLoading = false;
          attractionsSearchList.clear();
          AttractionsSearchModel attractionsSearchModel =
              AttractionsSearchModel.fromJson(value.data);

          attractionsSearchList.addAll(attractionsSearchModel.attractions);
          log("attractionsSearchList $attractionsSearchList");
        }
      });
    } catch (e) {
      isLoading = false;
      log("getAttractionSearchAPI :::");
    }
  }

  AttractionsDetailsModel? attractionsDetail;

  attractionsDetailsAPI(context, id) {
    try {
      apiServices
          .commonApi("${api.attractionsDetails}$id/details", [], ApiType.get,
              isToken: true)
          .then((value) {
        log("alue.data['responseStatus']::${value.data}");
        if (value.data['responseStatus'] == 1) {
          log("DDDDDD:${value.data}");
          AttractionsDetailsModel attractionsDetailModel =
              AttractionsDetailsModel.fromJson(value.data);
          attractionsDetail = attractionsDetailModel;

          route.pushNamed(context, routeName.attractionDetailScreen);
        }
      });
    } catch (e) {
      log("detailsDataAPI :: $e");
    }
  }

  getCategoriesData(context) {
    showLoading(context);
    notifyListeners();
    try {
      apiServices
          .commonApi(api.attractionCategories, [], ApiType.get)
          .then((value) {
        if (value.data['responseStatus'] == 1) {
          notifyListeners();

          log("API Response: attractionCategories ${value.data}");
          AttractionsCategoriesModel categoryModel =
              AttractionsCategoriesModel.fromJson(value.data);
          notifyListeners();
          // Clear old list and add new parsed categories
          categoryList.clear();
          notifyListeners();
          categoryList.addAll(categoryModel.categories ?? []);
          hideLoading(context);
          notifyListeners();
        }
      });
    } catch (e) {
      hideLoading(context);
      log("getCategoriesData $e");
    }
  }

  TextEditingController searchCtrl = TextEditingController();

  Timer? debounceTimer;

  void initSearchListener(BuildContext context) {
    searchCtrl.addListener(() => onSearchChange(context));
  }

  onSearchChange(context) {
    print("onSearchChange triggered");

    if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();
    log("rrrrr ssss${searchCtrl.text}");
    // Start a new debounce timer
    debounceTimer = Timer(Duration(milliseconds: 500), () {
      final query = searchCtrl.text.trim();
      log("rrrrr $query");
      if (query.isEmpty) {
        // getAttractionSearchAPI(context);
      } else if (query.length >= 3) {
        fetchSearchResults(query, context);
      }
    });
  }

  fetchSearchResults(query, context) async {
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    isLoading = true;
    Position position = await homePvr.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;
    try {
      apiServices
          .commonApi(
              "${api.attractionSearch}?name=$query&currentLongitude=$lon&currentLatitude=$lat",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        if (value.data['responseStatus'] == 1) {
          isLoading = false;
          attractionsSearchList.clear();
          AttractionsSearchModel attractionsSearchModel =
              AttractionsSearchModel.fromJson(value.data);
          attractionsSearchList.addAll(attractionsSearchModel.attractions);

          log("search aaaa $attractionsSearchList");
          notifyListeners();
        }
      });
    } catch (e) {
      isLoading = false;
      log("Search error: $e");
    }
  }

  double slider = 0.0,
      minPrice = 0,
      maxPrice = 100.00,
      lowerVal = 00.0,
      upperVal = 90.0;
  // int selectIndex = 0;

  void onFilter(int index, context) {
    setFilterIndex(index);
  }

  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  void setFilterIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }

  onCategoryChange(context, id) {
    if (!selectedCategory.contains(id)) {
      selectedCategory.add(id);
    } else {
      selectedCategory.remove(id);
    }
    log("SSS : $selectedCategory");
    notifyListeners();
  }

  int ratingIndex = 0;

  onSliderChange(handlerIndex, lowerValue, upperValue) {
    lowerVal = lowerValue;
    upperVal = upperValue;
    notifyListeners();
  }

  clearFilter(context) {
    selectedCategory = [];
    // selectedRates = [];
    searchList = [];
    lowerVal = 0.0;
    upperVal = maxPrice;
    slider = 0;
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    categoryList = homePvr.categoryList;
    route.pop(context);
    notifyListeners();
  }

  List selectedCategory = [];

  onBottomSheet(context, value1) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Consumer<OfferProvider>(builder: (context, ccc, child) {
            return SafeArea(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.14,
                    child: Stack(children: [
                      Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(language(context, appFonts.filterBy),
                                      style: appCss.dmDenseMedium18.textColor(
                                          appColor(context).darkText)),
                                  Icon(CupertinoIcons.multiply,
                                          color: appColor(context).darkText)
                                      .inkWell(onTap: () => route.pop(context))
                                ]).paddingSymmetric(horizontal: Insets.i20),
                            Container(
                                    alignment: Alignment.center,
                                    height: Sizes.s50,
                                    decoration: BoxDecoration(
                                        color: appColor(context).fieldCardBg,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(AppRadius.r30))),
                                    child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: appArray.filterList
                                                .asMap()
                                                .entries
                                                .map((e) => FilterTapLayout(
                                                    data: e.value,
                                                    index: e.key,
                                                    selectedIndex:
                                                        ccc.selectIndex,
                                                    onTap: () =>
                                                        ccc.onFilter(e.key)))
                                                .toList())
                                        .paddingAll(Insets.i5))
                                .paddingOnly(
                                    top: Insets.i25,
                                    bottom: (ccc.selectIndex == 0 ||
                                            ccc.selectIndex == 2)
                                        ? Insets.i20
                                        : 0,
                                    left: Insets.i20,
                                    right: Insets.i20),
                            if (ccc.selectIndex == 0)
                              Text(language(context, appFonts.categoryList),
                                      style: appCss.dmDenseRegular14.textColor(
                                          appColor(context).lightText))
                                  .paddingSymmetric(horizontal: Insets.i20),
                            if (ccc.selectIndex == 0) const VSpace(Sizes.s15),
                            if (ccc.selectIndex == 0) const VSpace(Sizes.s15),
                            Expanded(
                                child: Column(children: [
                              ccc.selectIndex == 0
                                  ? Expanded(
                                      child: ListView.builder(
                                          itemCount: categoryList.length,
                                          //physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return ListTileLayout(
                                                data: categoryList[index],
                                                selectedCategory:
                                                    selectedCategory,
                                                onTap: () {
                                                  onCategoryChange(
                                                      context,
                                                      categoryList[index]
                                                          .categoryId);
                                                });
                                          }))
                                  : ccc.selectIndex == 1
                                      ? SecondFilter(
                                          min: minPrice,
                                          max: maxPrice,
                                          lowerVal: lowerVal,
                                          upperVal: upperVal,
                                          selectIndex: ratingIndex,
                                          onDragging: (handlerIndex, lowerValue,
                                                  upperValue) =>
                                              onSliderChange(handlerIndex,
                                                  lowerValue, upperValue))
                                      : SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                              Text(
                                                      language(context,
                                                          appFonts.distance),
                                                      style: appCss
                                                          .dmDenseMedium14
                                                          .textColor(
                                                              appColor(context)
                                                                  .lightText))
                                                  .padding(
                                                      horizontal: Insets.i20,
                                                      bottom: Insets.i10),
                                              SizedBox(
                                                      height: Sizes.s115,
                                                      child: Column(children: [
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              IntrinsicHeight(
                                                                  child: Row(
                                                                      children: [
                                                                    SvgPicture.asset(
                                                                        eSvgAssets
                                                                            .country,
                                                                        colorFilter: ColorFilter.mode(
                                                                            appColor(context).darkText,
                                                                            BlendMode.srcIn)),
                                                                    VerticalDivider(
                                                                            indent:
                                                                                1,
                                                                            endIndent:
                                                                                1,
                                                                            width:
                                                                                1,
                                                                            color: appColor(context)
                                                                                .stroke)
                                                                        .paddingSymmetric(
                                                                            horizontal:
                                                                                Insets.i12),
                                                                    Text(
                                                                        language(
                                                                            context,
                                                                            appFonts
                                                                                .distanceLocation),
                                                                        style: appCss
                                                                            .dmDenseMedium14
                                                                            .textColor(appColor(context).darkText))
                                                                  ]))
                                                            ]),
                                                        SizedBox(
                                                            height: Sizes.s85,
                                                            child:
                                                                FlutterSlider(
                                                                    values: [
                                                                  slider
                                                                ],
                                                                    min: 0.0,
                                                                    max: 30.0,
                                                                    hatchMark:
                                                                        FlutterSliderHatchMark(
                                                                            density:
                                                                                0.3,
                                                                            // means 50 lines, from 0 to 100 percent
                                                                            displayLines:
                                                                                true,
                                                                            labelBox: FlutterSliderSizedBox(
                                                                                height:
                                                                                    10,
                                                                                width:
                                                                                    20,
                                                                                decoration: BoxDecoration(
                                                                                    color: appColor(context)
                                                                                        .trans)),
                                                                            smallLine: const FlutterSliderSizedBox(
                                                                                width:
                                                                                    1,
                                                                                height:
                                                                                    1),
                                                                            bigLine: const FlutterSliderSizedBox(
                                                                                width:
                                                                                    1,
                                                                                height:
                                                                                    1),
                                                                            labels: [
                                                                              FlutterSliderHatchMarkLabel(
                                                                                  percent: 0.5,
                                                                                  label: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                    Container(height: 4, width: 2, color: slider == 0.0 || slider == 5.0 || slider == 10.0 || slider == 15.0 || slider == 20.0 || slider == 25.0 || slider == 30.0 ? appColor(context).darkText : appColor(context).stroke),
                                                                                    const VSpace(Sizes.s3),
                                                                                    Text('0\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                  ])),
                                                                              FlutterSliderHatchMarkLabel(
                                                                                  percent: 17,
                                                                                  label: Column(children: [
                                                                                    Container(height: 4, width: 2, color: slider == 5.0 || slider == 10.0 || slider == 15.0 || slider == 20.0 || slider == 25.0 || slider == 30.0 ? appColor(context).darkText : appColor(context).stroke),
                                                                                    const VSpace(Sizes.s3),
                                                                                    Text('5\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                  ])),
                                                                              FlutterSliderHatchMarkLabel(
                                                                                  percent: 33.5,
                                                                                  label: Column(children: [
                                                                                    Container(height: 4, width: 2, color: slider == 10.0 || slider == 15.0 || slider == 20.0 || slider == 25.0 || slider == 30.0 ? appColor(context).darkText : appColor(context).stroke),
                                                                                    const VSpace(Sizes.s3),
                                                                                    Text('10\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                  ])),
                                                                              FlutterSliderHatchMarkLabel(
                                                                                  percent: 50,
                                                                                  label: Column(children: [
                                                                                    Container(height: 4, width: 2, color: slider == 15.0 || slider == 20.0 || slider == 25.0 || slider == 30.0 ? appColor(context).darkText : appColor(context).stroke),
                                                                                    const VSpace(Sizes.s3),
                                                                                    Text('15\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                  ])),
                                                                              FlutterSliderHatchMarkLabel(
                                                                                  percent: 66,
                                                                                  label: Column(children: [
                                                                                    Container(
                                                                                      height: 4,
                                                                                      width: 2,
                                                                                      color: slider == 20.0 || slider == 25.0 || slider == 30.0 ? appColor(context).darkText : appColor(context).stroke,
                                                                                    ),
                                                                                    const VSpace(Sizes.s3),
                                                                                    Text('20\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1))
                                                                                  ])),
                                                                              FlutterSliderHatchMarkLabel(
                                                                                  percent: 84,
                                                                                  label: Column(
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 4,
                                                                                        width: 2,
                                                                                        color: slider == 25.0 || slider == 30.0 ? appColor(context).darkText : appColor(context).stroke,
                                                                                      ),
                                                                                      const VSpace(Sizes.s3),
                                                                                      Text('25\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1)),
                                                                                    ],
                                                                                  )),
                                                                              FlutterSliderHatchMarkLabel(
                                                                                  percent: 100,
                                                                                  label: Column(
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 4,
                                                                                        width: 2,
                                                                                        color: slider == 30.0 ? appColor(context).darkText : appColor(context).stroke,
                                                                                      ),
                                                                                      const VSpace(Sizes.s3),
                                                                                      Text('30\nkm', textAlign: TextAlign.center, style: appCss.dmDenseMedium12.textColor(appColor(context).darkText).textHeight(1)),
                                                                                    ],
                                                                                  )),
                                                                            ],
                                                                            labelsDistanceFromTrackBar:
                                                                                35),
                                                                    tooltip: FlutterSliderTooltip(
                                                                        alwaysShowTooltip:
                                                                            false,
                                                                        disabled:
                                                                            true),
                                                                    handler: FlutterSliderHandler(
                                                                        decoration: BoxDecoration(
                                                                            color: appColor(context)
                                                                                .trans),
                                                                        child: SvgPicture.asset(eSvgAssets.userSlider, height: Sizes.s28).paddingOnly(
                                                                            bottom:
                                                                                14)),
                                                                    trackBar: FlutterSliderTrackBar(
                                                                        activeTrackBarHeight:
                                                                            4.5,
                                                                        activeTrackBarDraggable:
                                                                            true,
                                                                        inactiveTrackBar:
                                                                            BoxDecoration(borderRadius: BorderRadius.circular(10), color: appColor(context).stroke),
                                                                        activeTrackBar: BoxDecoration(borderRadius: BorderRadius.circular(10), color: appColor(context).darkText),
                                                                        inactiveTrackBarHeight: 4.5,
                                                                        inactiveDisabledTrackBarColor: appColor(context).stroke,
                                                                        activeDisabledTrackBarColor: appColor(context).darkText),
                                                                    step: const FlutterSliderStep(step: 5),
                                                                    jump: true,
                                                                    onDragging: (handlerIndex, lowerValue, upperValue) => slidingValue(lowerValue)))
                                                      ]))
                                                  .paddingSymmetric(
                                                      vertical: Insets.i12,
                                                      horizontal: Insets.i15)
                                                  .boxBorderExtension(context,
                                                      isShadow: true)
                                                  .padding(
                                                      horizontal: Insets.i20,
                                                      bottom: Insets.i15)
                                            ]))
                            ]))
                          ])
                          .paddingSymmetric(vertical: Insets.i20)
                          .marginOnly(bottom: Insets.i50),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: BottomSheetButtonCommon(
                              textOne: appFonts.clearAll,
                              textTwo: appFonts.apply,
                              applyTap: () {
                                // searchService(context, isPop: true);
                              },
                              clearTap: () => clearFilter(context)))
                    ])).bottomSheetExtension(context));
          });
        }).then((value) {
      log("DDDD");
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      dash.notifyListeners();
      searchCtrl.text = "";
    });
  }

  slidingValue(newValue) {
    log("slide $slider");
    log("slidnewValuee $newValue");
    slider = newValue;
    notifyListeners();
  }

  //featured package list
  getFeaturedPackage(HomeScreenProvider homePvr) async {
    searchList = [];
    if (txtFeaturedSearch.text.isNotEmpty) {
      for (var data in homePvr.highestRateList) {
        if (data.name!
            .toLowerCase()
            .contains(txtFeaturedSearch.text.toLowerCase())) {
          if (!searchList.contains(data)) {
            searchList.add(data);
          }
          notifyListeners();
        }
      }
    } else {
      notifyListeners();
    }
  }

  onBack(HomeScreenProvider homePvr, context) {
    txtFeaturedSearch.text = "";
    searchList = [];
    notifyListeners();
    getFeaturedPackage(homePvr);
    route.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
