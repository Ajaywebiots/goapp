import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:goapp/models/api_model/attractions_details_model.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';

import '../../config.dart';
import '../../models/api_model/attraction_categories_model.dart';
import '../../models/api_model/attractions_search_model.dart';
import '../../models/provider_model.dart';
import '../../screens/app_pages_screen/search_screen/filter_tap_layout.dart';
import '../../screens/app_pages_screen/search_screen/layouts/list_tile_common.dart';
import '../../screens/app_pages_screen/search_screen/layouts/rating_bar_layout.dart';
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
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            notifyListeners();
            isLoading = false;
            attractionsSearchList.clear();
            AttractionsSearchModel attractionsSearchModel =
                AttractionsSearchModel.fromJson(value.data);

            attractionsSearchList.addAll(attractionsSearchModel.attractions);
            log("attractionsSearchList $attractionsSearchList");
          }
        } else {
          isLoading = false;
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      isLoading = false;
      log("getAttractionSearchAPI :::");
    }
  }

  AttractionsDetailsModel? attractionsDetail;

  attractionsDetailsAPI(context, id, {isNotRoute = false}) {
    notifyListeners();
    try {
      apiServices
          .commonApi("${api.attractionsDetails}$id/details", [], ApiType.get,
              isToken: true)
          .then((value) {
        log("alue.data['responseStatus']::${value.data}");
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            notifyListeners();
            log("DDDDDD:${value.data}");
            AttractionsDetailsModel attractionsDetailModel =
                AttractionsDetailsModel.fromJson(value.data);
            attractionsDetail = attractionsDetailModel;
            notifyListeners();
            isNotRoute == true
                ? null
                : route.pushNamed(context, routeName.attractionDetailScreen);
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
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
        if (value.isSuccess == true) {
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
        } else {
          isLoading = false;
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
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
        getAttractionSearchAPI(context);
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
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            isLoading = false;
            attractionsSearchList.clear();
            AttractionsSearchModel attractionsSearchModel =
                AttractionsSearchModel.fromJson(value.data);
            attractionsSearchList.addAll(attractionsSearchModel.attractions);

            log("search aaaa $attractionsSearchList");
            notifyListeners();
          }
        } else {
          isLoading = false;
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
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
      notifyListeners();
      selectedCategory.add(id);
      notifyListeners();
    } else {
      notifyListeners();
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

    selectedRates = [];
    searchList = [];
    getAttractionSearchAPI(context);
    lowerVal = 0.0;
    upperVal = maxPrice;
    slider = 0;
    // final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    // categoryList = homePvr.categoryList;
    route.pop(context);
    notifyListeners();
  }

  List selectedCategory = [];
  List selectedRates = [];

  searchService(BuildContext context, {bool isPop = false}) async {
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    Position position = await homePvr.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;
    try {
      final ratingMap = {0: 5, 1: 4, 2: 3, 3: 2, 4: 1};
      final selectedRatingValues = selectedRates
          .map((i) => ratingMap[i])
          .where((e) => e != null)
          .toList();

      final distanceParam = slider.toInt(); // radius

      // Final query params
      Map<String, dynamic> queryParams = {
        "rating": selectedRatingValues,
        "radius": distanceParam,
        "category": selectedCategory,
        "currentLongitude": lon,
        "currentLatitude": lat
      };

      Uri url = buildUriWithRepeatedKeys(api.attractionSearch, queryParams);

      log("Final API URL: $url");

      apiServices.commonApi(url, [], ApiType.get, isToken: true).then((value) {
        if (value.isSuccess! && value.data['responseStatus'] == 1) {
          // hideLoading(context);
          attractionsSearchList.clear();
          notifyListeners();
          AttractionsSearchModel businessSearchModel =
              AttractionsSearchModel.fromJson(value.data);
          notifyListeners();
          attractionsSearchList.addAll(businessSearchModel.attractions);
          notifyListeners();
          log("attractionsSearchList $attractionsSearchList");
        }
      });

      if (isPop) {
        route.pop(context);
      }
    } catch (e) {
      log("searchService error: $e");
    }
  }

  Uri buildUriWithRepeatedKeys(String baseUrl, Map<String, dynamic> params) {
    List<String> queryParts = [];

    params.forEach((key, value) {
      if (value is List) {
        for (var item in value) {
          queryParts.add(
              '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(item.toString())}');
        }
      } else {
        queryParts.add(
            '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(value.toString())}');
      }
    });

    return Uri.parse('$baseUrl?${queryParts.join('&')}');
  }

  onBottomSheet(context, value1) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Consumer<AttractionProvider>(builder: (context, ccc, child) {
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
                                                    onTap: () => ccc.onFilter(
                                                        e.key, context)))
                                                .toList())
                                        .paddingAll(Insets.i5))
                                .paddingOnly(
                                    top: Insets.i25,
                                    bottom:
                                        (selectIndex == 0 || selectIndex == 2)
                                            ? Insets.i20
                                            : 0,
                                    left: Insets.i20,
                                    right: Insets.i20),
                            if (selectIndex == 0)
                              Text(language(context, appFonts.categoryList),
                                      style: appCss.dmDenseRegular14.textColor(
                                          appColor(context).lightText))
                                  .paddingSymmetric(horizontal: Insets.i20),
                            if (selectIndex == 0) const VSpace(Sizes.s15),
                            if (selectIndex == 0) const VSpace(Sizes.s15),
                            Expanded(
                                child: Column(children: [
                              selectIndex == 0
                                  ? Expanded(
                                      child: ListView.builder(
                                          itemCount: ccc.categoryList.length,
                                          //physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return ListTileLayout(
                                                data: ccc.categoryList[index],
                                                selectedCategory:
                                                    ccc.selectedCategory,
                                                onTap: () {
                                                  ccc.onCategoryChange(
                                                      context,
                                                      ccc.categoryList[index]
                                                          .categoryId);
                                                });
                                          }))
                                  : selectIndex == 1
                                      ? /*SecondFilter(
                                          min: minPrice,
                                          max: maxPrice,
                                          lowerVal: lowerVal,
                                          upperVal: upperVal,
                                          selectIndex: ratingIndex,
                                          onDragging: (handlerIndex, lowerValue,
                                                  upperValue) =>
                                              onSliderChange(handlerIndex,
                                                  lowerValue, upperValue))*/
                                      SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                              const VSpace(Sizes.s20),
                                              Text(
                                                      language(context,
                                                          appFonts.rating),
                                                      style: appCss
                                                          .dmDenseMedium14
                                                          .textColor(
                                                              appColor(context)
                                                                  .lightText))
                                                  .paddingOnly(
                                                      left: Insets.i20),
                                              const VSpace(Sizes.s15),
                                              ...appArray.ratingList
                                                  .asMap()
                                                  .entries
                                                  .map((e) => RatingBarLayout(
                                                      index: e.key,
                                                      data: e.value,
                                                      selectedIndex:
                                                          selectedRates
                                                              .contains(e.key),
                                                      onTap: () =>
                                                          onTapRating(e.key)))
                                            ]))
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
                              applyTap: () =>
                                  searchService(context, isPop: true),
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

  onTapRating(id) {
    if (!selectedRates.contains(id)) {
      selectedRates.add(id);
      log("mmmm $selectedRates");
    } else {
      selectedRates.remove(id);
    }

    notifyListeners();
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

  String totalCountFilter() {
    int typeCount = selectedCategory.length;
    int rateCount = selectedRates.length;
    int distanceCount = (slider != 0.0) ? 1 : 0;

    int total = typeCount + rateCount + distanceCount;

    log('type Count: $typeCount');
    log('Distance Count: $distanceCount');
    log('Total Filter Count: $total');

    return total.toString();
  }
}
