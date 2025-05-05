import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:goapp/config.dart';
import 'package:goapp/models/api_model/business_category_model.dart';
import 'package:goapp/providers/app_pages_provider/rate_app_provider.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';

import '../../common_tap.dart';
import '../../models/api_model/business_details_model.dart';
import '../../models/api_model/business_search_model.dart';
import '../../models/api_model/home_feed_model.dart';
import '../../models/category_model.dart';
import '../../models/service_model.dart';
import '../../screens/app_pages_screen/search_screen/filter_tap_layout.dart';
import '../../screens/app_pages_screen/search_screen/layouts/list_tile_common.dart';
import '../../screens/app_pages_screen/search_screen/layouts/second_filter.dart';
import '../../screens/app_pages_screen/search_screen/layouts/third_filter.dart';
import '../../services/api_service.dart';
import '../../widgets/dotted_line.dart';
import '../../widgets/edit_review_layout.dart';
import '../bottom_providers/dashboard_provider.dart';
import 'categories_details_provider.dart';

class SearchProvider with ChangeNotifier {
  AnimationController? animationController;
  SharedPreferences? pref;
  TextEditingController searchCtrl = TextEditingController();
  TextEditingController filterSearchCtrl = TextEditingController();
  List<Categories> categoryList = [];
  List<CategoryModel> type = [];
  Future<ui.Image>? loadingImage;
  final FocusNode searchFocus = FocusNode();
  final FocusNode filterSearchFocus = FocusNode();
  List selectedCategory = [];
  List selectedRates = [];
  List<Services> searchList = [];
  List<Services> recentSearchList = [];

  int selectedIndex = -1;

  bool isLoading = false;

  onSubCategories(context, index, id) {
    selectedIndex = index;
    notifyListeners();
    popular = false;
    businessSearchList.clear();
    log("cateeee $id");
    getBusinessSearchAPI(context, id: id, isFilter: true);
    // onSubCategoriesStored(context, index, id);
    notifyListeners();
    log("idid:$id");
    // getServiceByCategoryId(context, id);
  }

  ui.FrameInfo? image, image1;
  double slider = 0.0,
      minPrice = 0,
      maxPrice = 100.00,
      lowerVal = 00.0,
      upperVal = 90.0;
  bool? isSelect, isSearch = false;
  int ratingIndex = 0, selectedFilterCount = 0;

  onSliderChange(handlerIndex, lowerValue, upperValue) {
    lowerVal = lowerValue;
    upperVal = upperValue;
    notifyListeners();
  }

  onBack() {
    searchList = [];
    isSearch = false;
    searchCtrl.text = "";
    notifyListeners();
  }

  BusinessDetailModel? businessDetail;

  bool isNavigating = false;

  businessDetailsAPI(context, id, {bool isNotRouting = false}) async {
    if (isNavigating) return;
    isNavigating = true;
    notifyListeners();

    try {
      final value = await apiServices.commonApi(
          "${api.businessDetails}$id/details", [], ApiType.get,
          isToken: true);

      if (value.isSuccess == true && value.data['responseStatus'] == 1) {
        BusinessDetailModel businessDetailModel =
            BusinessDetailModel.fromJson(value.data);
        businessDetail = businessDetailModel;
        notifyListeners();

        if (!isNotRouting) {
          route.pushNamed(context, routeName.businessDetailsScreen);
        }
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, routeName.login, (Route<dynamic> route) => false);
      }
    } catch (e) {
      log("detailsDataAPI :: $e");
    } finally {
      isNavigating = false;
      notifyListeners();
    }
  }

  onTapRating(id) {
    if (!selectedRates.contains(id)) {
      selectedRates.add(id);
    } else {
      selectedRates.remove(id);
    }
    notifyListeners();
  }

  onChange() {
    isSelect = false;
    notifyListeners();
  }

  onChange1() {
    isSelect = true;
    notifyListeners();
  }

  double sliderValue = 0.0;

  onChangeSlider(sVal) {
    notifyListeners();
    sliderValue = sVal;
    notifyListeners();
  }

  Future<ui.FrameInfo> loadImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        targetWidth: 25);
    ui.FrameInfo fi = await codec.getNextFrame();

    notifyListeners();
    return fi;
  }

  loadImage1() async {}

  ui.Image? customImage;

  slidingValue(newValue) {
    log("slide $slider");
    log("slidnewValuee $newValue");
    slider = newValue;
    notifyListeners();
  }

  int selectCategoryIndex = 0;
  int selectIndex = 0;

  onFilter(index) {
    selectIndex = index;
    notifyListeners();
  }

  onAnimate(context) async {
    // pref = await SharedPreferences.getInstance();

    notifyListeners();
    // getRecentSearch();
    // animationController = AnimationController(
    //     vsync: sync, duration: const Duration(milliseconds: 1200));
    // FrameInfo fi = await loadImage(eImageAssets.userSlider);
    // customImage = fi.image;
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    final cat = Provider.of<CategoriesDetailsProvider>(context, listen: false);
    categoryList = homePvr.categoryList;
    // recentSearchList =
    //     appArray.recentSearch.map((e) => Services.fromJson(e)).toList();
    cat.onReady(context);
    notifyListeners();
    log("CATEG :${categoryList.length}");
  }

  List<Categories> cachedServiceList = [];

  /*onSubCategoriesStored(context, index, id) async {
    cachedServiceList = [];
    selectedIndex = index;
    notifyListeners();
    log("cachedServiceList :${selectedIndex}///$index//$id");

    // Store last 3 selected list data
    int val = cachedServiceList.indexWhere(
        (element) => element.categoryId.toString() == id.toString());
    log("index :$val");
    if (val >= 0) {
      businessSearchList = cachedServiceList[val].categoryId! as List<Business>;
    } else {
      getBusinessSearchAPI(context, id: id);
    }

    log("STORED LIST::${businessSearchList.length}");
    log("STORED LIST::${cachedServiceList[val]}");
    // await getServiceByCategoryId(context, id);
    // hideLoading(context);
    // notifyListeners();
  }*/

  // getRecentSearch() {
  //   dynamic save = pref!.getString(session.recentSearch);
  //   log("PREE :$save");
  //   if (save != null) {
  //     final List<dynamic> jsonData =
  //         jsonDecode(pref!.getString(session.recentSearch) ?? '[]');
  //     log("jsonData :${jsonData.length}");
  //     recentSearchList = jsonData.map<Services>((jsonList) {
  //       return Services.fromJson(jsonList);
  //     }).toList();
  //     notifyListeners();
  //   }
  // }

  Timer? debounceTimer;

  // SearchProvider() {
  //   searchCtrl.addListener(onSearchChange);
  // }

  void onSearchChange(context, id, {isPopular}) {
    log("searchPvr.selectIndex ${id}");
    if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();
    log("rrrrr ssss${searchCtrl.text}");
    // Start a new debounce timer
    debounceTimer = Timer(Duration(milliseconds: 500), () {
      final query = searchCtrl.text.trim();
      log("rrrrr $query");
      if (query.isEmpty) {
        getBusinessSearchAPI(context);
      } else if (query.length >= 3) {
        fetchSearchResults(query, id, isPopular: isPopular);
      }
    });
  }

  void fetchSearchResults(String query, id, {isPopular = false}) {
    try {
      final pop = "${api.businessSearch}?name=$query";
      apiServices
          .commonApi(
              isPopular == true
                  ? pop
                  : "${api.businessSearch}?categories=${id + 1}&name=$query",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        if (value.data['responseStatus'] == 1) {
          businessSearchList.clear();
          BusinessSearchModel businessSearchModel =
              BusinessSearchModel.fromJson(value.data);
          businessSearchList.addAll(businessSearchModel.businesses);

          log("search aaaa $businessSearchList");
          notifyListeners();
        }
      });
    } catch (e) {
      log("Search error: $e");
    }
  }

  onBottomSheet(context, value1) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SafeArea(
              child: Consumer<SearchProvider>(builder: (context, value, child) {
            return SizedBox(
                height: MediaQuery.of(context).size.height / 1.14,
                child: Stack(children: [
                  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(language(context, appFonts.filterBy),
                                  style: appCss.dmDenseMedium18
                                      .textColor(appColor(context).darkText)),
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
                                                    value.selectIndex,
                                                onTap: () =>
                                                    value.onFilter(e.key)))
                                            .toList())
                                    .paddingAll(Insets.i5))
                            .paddingOnly(
                                top: Insets.i25,
                                bottom: (value.selectIndex == 0 ||
                                        value.selectIndex == 2)
                                    ? Insets.i20
                                    : 0,
                                left: Insets.i20,
                                right: Insets.i20),
                        if (value.selectIndex == 0)
                          Text(language(context, appFonts.categoryList),
                                  style: appCss.dmDenseRegular14
                                      .textColor(appColor(context).lightText))
                              .paddingSymmetric(horizontal: Insets.i20),
                        if (value.selectIndex == 0) const VSpace(Sizes.s15),
                        // if (value.selectIndex == 0)
                        //   SearchTextFieldCommon(
                        //       controller: value.filterSearchCtrl,
                        //       focusNode: value.filterSearchFocus,
                        //       onChanged: (v) {
                        //         if (v.isEmpty) {
                        //           log("v.isEmpty:${v.isEmpty}");
                        //           if (value.selectIndex == 0) {
                        //             value.getCategory();
                        //           }
                        //         }
                        //       },
                        //       onFieldSubmitted: (v) {
                        //         if (value.selectIndex == 0) {
                        //           value.getCategory(search: value.filterSearchCtrl.text);
                        //         }
                        //       }).paddingSymmetric(horizontal: Insets.i20),
                        if (value.selectIndex == 0) const VSpace(Sizes.s15),
                        Expanded(
                            child: Column(children: [
                          value.selectIndex == 0
                              ? Expanded(
                                  child: ListView.builder(
                                      itemCount: value1.categoryList.length,
                                      //physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return ListTileLayout(
                                            data: value1.categoryList[index],
                                            selectedCategory:
                                                value.selectedCategory,
                                            onTap: () {
                                              value.onCategoryChange(
                                                  context,
                                                  value1.categoryList[index]
                                                      .categoryId);
                                            });
                                      }))
                              : value.selectIndex == 1
                                  ? SecondFilter(
                                      min: value.minPrice,
                                      max: value.maxPrice,
                                      lowerVal: value.lowerVal,
                                      upperVal: value.upperVal,
                                      selectIndex: value.ratingIndex,
                                      onDragging: (handlerIndex, lowerValue,
                                              upperValue) =>
                                          value.onSliderChange(handlerIndex,
                                              lowerValue, upperValue))
                                  : const ThirdFilter()
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
                            value.searchService(context, isPop: true);
                          },
                          clearTap: () => value.clearFilter(context)))
                ])).bottomSheetExtension(context);
          }));
        }).then((value) {
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      getCategory();
      dash.notifyListeners();
      filterSearchCtrl.text = "";
    });
  }

  //category list
  getCategory({search}) async {
    // categoryList =
    // appArray.categoryList.map((e) => CategoryModel.fromJson(e)).toList();
    type = appArray.type.map((e) => CategoryModel.fromJson(e)).toList();
    notifyListeners();
  }

  onCategoryChange(context, id) {
    if (!selectedCategory.contains(id)) {
      selectedCategory.add(id);
    } else {
      selectedCategory.remove(id);
    }

    notifyListeners();
  }

  String totalCountFilter() {
    int categoryCount = selectedCategory.length;
    int ratingCount = selectedRates.length;
    int distanceCount = (slider != 0.0) ? 1 : 0;
    int total = categoryCount + ratingCount + distanceCount;

    return total.toString();
  }

  // String totalCountFilter() {
  //   int count = 0;
  //   if (selectedCategory.isNotEmpty) {
  //     print('Selected Category is not empty');
  //     count++;
  //   }
  //   /* if (!(lowerVal == 0.0 && (upperVal == maxPrice || upperVal == 100.0))) {
  //     print('Price filter applied');
  //     count++;
  //   }*/
  //   if (selectedRates.isNotEmpty) {
  //     print('Selected rates is not empty');
  //     count++;
  //   }
  //   if (slider != 0.0) {
  //     print('Slider is not zero');
  //     count++;
  //   }
  //   if (isSelect != null) {
  //     print('isSelect is not null');
  //     count++;
  //   }
  //   print('Total Count: $count');
  //   return count.toString();
  // }

  //clear filter
  clearFilter(context) {
    isPopularSelected = false;
    selectedCategory = [];
    selectedRates = [];
    searchList = [];
    lowerVal = 0.0;
    upperVal = maxPrice;
    slider = 0;
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    categoryList = homePvr.categoryList;
    route.pop(context);
    popular = true;
    getBusinessSearchAPI(context);
    notifyListeners();
  }

  // search list
  /*searchService(context, {isPop = false}) async {
    log("categoryList :::$selectedCategory");
    log("selectedRates :::$selectedRates");
    log("slider :::$slider");

    */ /* if (isPop) {
      route.pop(context);
    }*/ /*

    */ /* final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    searchList = [];
    notifyListeners();
    String apiUrl = "";
    if (isSelect != null &&
        !isSelect! &&
        selectedCategory.isEmpty &&
        selectedRates.isEmpty &&
        lowerVal == 0 &&
        upperVal == 100) {
      apiUrl =
          "${api.service}?latitude=${position!.latitude}&longitude=${position!.longitude}";
    }
    if (selectedCategory.isNotEmpty) {
      apiUrl =
          "${api.service}?categoryIds=$selectedCategory&latitude=${position!.latitude}&longitude=${position!.longitude}";
    }
    if (selectedRates.isNotEmpty) {
      apiUrl =
          "${api.service}?categoryIds=$selectedCategory&latitude=${position!.latitude}&longitude=${position!.longitude}&rating=$selectedRates";
    }

    if (selectedRates.isNotEmpty && selectedCategory.isNotEmpty) {
      apiUrl =
          "${api.service}?categoryIds=$selectedCategory&latitude=${position!.latitude}&longitude=${position!.longitude}&rating=$selectedRates";
    }

    if (lowerVal != 0 && upperVal != 100) {
      apiUrl =
          "${api.service}?min=$lowerVal&max$upperVal&latitude=${position!.latitude}&longitude=${position!.longitude}";
    }

    if (isSelect != null && !isSelect!) {
      apiUrl =
          "${api.service}?latitude=${position!.latitude}&longitude=${position!.longitude}&distance=$slider";
    }

    if (isSelect != null && !isSelect! && selectedRates.isNotEmpty) {
      apiUrl =
          "${api.service}?latitude=${position!.latitude}&longitude=${position!.longitude}&distance=$slider&rating$selectedRates";
    }

    if (isSelect != null && !isSelect! && selectedCategory.isNotEmpty) {
      apiUrl =
          "${api.service}?latitude=${position!.latitude}&longitude=${position!.longitude}&distance=$slider&categoryIds$selectedCategory";
    }

    if (isSelect != null &&
        !isSelect! &&
        selectedRates.isNotEmpty &&
        selectedCategory.isNotEmpty) {
      apiUrl =
          "${api.service}?latitude=${position!.latitude}&longitude=${position!.longitude}&distance=$slider&rating$selectedRates&categoryIds$selectedCategory";
    }

    if (lowerVal != 0 && upperVal != 100 && selectedCategory.isNotEmpty) {
      apiUrl =
          "${api.service}?categoryIds=$selectedCategory&min=$lowerVal&max$upperVal&latitude=${position!.latitude}&longitude=${position!.longitude}";
    }

    if (lowerVal != 0 && upperVal != 100 && selectedRates.isNotEmpty) {
      apiUrl =
          "${api.service}?rating=$selectedRates&min=$lowerVal&max$upperVal&latitude=${position!.latitude}&longitude=${position!.longitude}";
    }

    if (lowerVal != 0 &&
        upperVal != 100 &&
        selectedRates.isNotEmpty &&
        selectedCategory.isNotEmpty) {
      apiUrl =
          "${api.service}?categoryIds=$selectedCategory&rating=$selectedRates&min=$lowerVal&max$upperVal&latitude=${position!.latitude}&longitude=${position!.longitude}";
    }

    if (lowerVal != 0 &&
        upperVal != 100 &&
        selectedCategory.isNotEmpty &&
        selectedRates.isNotEmpty &&
        isSelect!) {
      apiUrl =
          "${api.service}?categoryIds=$selectedCategory&min=$lowerVal&max$upperVal&latitude=${position!.latitude}&longitude=${position!.longitude}&distance=$slider&rating=$selectedRates";
    }

    if (lowerVal != 0 && upperVal != 100 && isSelect!) {
      apiUrl =
          "${api.service}?min=$lowerVal&max$upperVal&latitude=${position!.latitude}&longitude=${position!.longitude}&distance=$slider";
    }
    if (searchCtrl.text.isNotEmpty) {
      apiUrl =
          "${api.service}?latitude=${position!.latitude}&longitude=${position!.longitude}&search=${searchCtrl.text}";
    } else {
      searchList = [];
    }
    log("SER : $apiUrl");
    try {
      searchList = [];
      notifyListeners();
      await apiServices.getApi(apiUrl, []).then((value) {
        if (value.isSuccess!) {
          for (var data in value.data) {
            if (!searchList.contains(Services.fromJson(data))) {
              searchList.add(Services.fromJson(data));
            }
          }
        }
        if (isPop) {
          route.pop(context);
        }
        if (searchList.isNotEmpty) {
          isSearch = false;
        } else {
          isSearch = true;
        }
        notifyListeners();
      });
    } catch (e) {
      log("ERRROEEE searchService $e");
      notifyListeners();
    }*/ /*
    */ /*searchList = [];

    List<Services> serviceList =
        appArray.servicesList.map((e) => Services.fromJson(e)).toList();
    for (var search in serviceList) {
      log("search.title!. :${search.title!} // ${searchCtrl.text}");
      if (search.title!
          .toLowerCase()
          .replaceAll(" ", "")
          .contains(searchCtrl.text)) {
        searchList.add(search);
      }
      notifyListeners();
    }
    if (searchList.isNotEmpty) {
      isSearch = false;
    } else {
      isSearch = true;
    }*/ /*
  }*/

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

  bool isFilter = false;

  searchService(BuildContext context, {bool isPop = false}) async {
    isPopularSelected = true;
    notifyListeners();
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
        "categories": selectedCategory,
        "currentLongitude": lon,
        "currentLatitude": lat
      };

      Uri url = buildUriWithRepeatedKeys(api.businessSearch, queryParams);

      apiServices.commonApi(url, [], ApiType.get, isToken: true).then((value) {
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            // hideLoading(context);
            businessSearchList.clear();
            notifyListeners();
            BusinessSearchModel businessSearchModel =
                BusinessSearchModel.fromJson(value.data);
            notifyListeners();
            businessSearchList.addAll(businessSearchModel.businesses);
            notifyListeners();
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });

      if (isPop) {
        route.pop(context);
      }
    } catch (e) {}
  }

  searchClear() {
    notifyListeners();

    searchCtrl.text = "";
    isSearch = true;
    notifyListeners();
  }

  onFeatured(context, Services? services, id, {inCart}) async {
    if (inCart) {
      route.pop(context);
      // route.pushNamed(context, routeName.cartScreen);
    } else {
      onBook(context, services!,
          addTap: () => onAdd(id),
          minusTap: () => onRemoveService(context, id)).then((e) {
        searchList[id].selectedRequiredServiceMan =
            searchList[id].requiredServicemen;
        notifyListeners();
      });
    }
  }

  onTapFeatures(context, Services? services, id) async {
    List<Services> saveList = [];
    dynamic save = pref!.getString(session.recentSearch);

    if (save == null) {
      saveList.add(services!);
    } else {
      final List<dynamic> jsonData =
          jsonDecode(pref!.getString(session.recentSearch) ?? '[]');

      saveList = jsonData.map<Services>((jsonList) {
        return Services.fromJson(jsonList);
      }).toList();

      if (saveList.length == 5) {
        saveList.removeAt(0);
        saveList.add(services!);
      } else {
        int ind = saveList.indexWhere((element) => services!.id == element.id);

        if (ind < 0) {
          saveList.add(services!);
        }
      }
    }

    recentSearchList = saveList;

    pref!.setString(session.recentSearch, jsonEncode(saveList));
    notifyListeners();
    // route.pushNamed(context, routeName.businessDetailsScreen,
    //     arg: services!.id);
  }

  onRemoveService(context, index) {
    if (int.parse(searchList[index].selectedRequiredServiceMan!) == 1) {
      route.pop(context);
    } else {
      searchList[index].selectedRequiredServiceMan =
          (int.parse(searchList[index].selectedRequiredServiceMan!) - 1)
              .toString();
    }
    notifyListeners();
  }

  onAdd(index) {
    int count = int.parse(searchList[index].selectedRequiredServiceMan!);
    count++;
    searchList[index].selectedRequiredServiceMan = count.toString();

    notifyListeners();
  }

  bool popular = true;
  bool isPopularSelected = false;
  List<Business> businessSearchList = [];

  getBusinessSearchAPI(context, {int? id, bool? isFilter}) async {
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    Position position = await homePvr.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;

    final filterList =
        "${api.businessSearch}?categories=$id&currentLongitude=$lon&currentLatitude=$lat";
    try {
      apiServices
          .commonApi(
              isFilter == true
                  ? filterList
                  : "${api.businessSearch}?currentLongitude=$lon&currentLatitude=$lat",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            // hideLoading(context);
            businessSearchList.clear();
            notifyListeners();
            BusinessSearchModel businessSearchModel =
                BusinessSearchModel.fromJson(value.data);
            notifyListeners();
            businessSearchList.addAll(businessSearchModel.businesses);
            notifyListeners();
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      // hideLoading(context);
      log("getBusinessSearchAPI :::");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }

  /*Timer? debounceTimer;

  SearchProvider() {
    searchCtrl.addListener(onSearchChange);
  }

  onSearchChange() {
    if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();
    log("rrrrr ssss${searchCtrl.text}");
    // Start a new debounce timer
    debounceTimer = Timer(Duration(milliseconds: 500), () {
      final query = searchCtrl.text.trim();
      log("rrrrr $query");
      if (query.length >= 3) {
        fetchSearchResults(query);
      }
    });
  }

  void fetchSearchResults(String query) {
    try {
      apiServices
          .commonApi("${api.businessSearch}?name=$query", [], ApiType.get,
              isToken: true)
          .then((value) {
        if (value.data['responseStatus'] == 0) {
          businessSearchList.clear();
          BusinessSearchModel businessSearchModel =
              BusinessSearchModel.fromJson(value.data);
          businessSearchList.addAll(businessSearchModel.businesses);
          notifyListeners();
        }
      });
    } catch (e) {
      log("Search error: $e");
    }
  }*/

  void onReady() {}

  addReviewTap(context, RateAppProvider? value) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: SizedBox(
                          child: Stack(children: [
                SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(language(context, appFonts.addReview),
                                style: appCss.dmDenseMedium18
                                    .textColor(appColor(context).darkText)),
                            Icon(CupertinoIcons.multiply,
                                    color: appColor(context).darkText)
                                .inkWell(onTap: () => route.pop(context))
                          ]).paddingSymmetric(
                          vertical: 20, horizontal: Insets.i20),
                      Column(children: [
                        Text(language(context, appFonts.whatDoYouThink),
                                style: appCss.dmDenseMedium14
                                    .textColor(appColor(context).lightText))
                            .paddingAll(Insets.i20),
                        const DottedLines(),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(language(context, appFonts.rateUs),
                                  style: appCss.dmDenseMedium14
                                      .textColor(appColor(context).darkText)),
                              const VSpace(Sizes.s12),
                              Consumer<RateAppProvider>(
                                  builder: (context, rate, child) {
                                return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: appArray.editReviewList
                                                .asMap()
                                                .entries
                                                .map((e) => EditReviewLayout(
                                                    data: e.value,
                                                    index: e.key,
                                                    selectIndex:
                                                        rate.selectedIndex,
                                                    onTap: () =>
                                                        rate.onTapEmoji(e.key)))
                                                .toList())
                                        .width(
                                            MediaQuery.of(context).size.width /
                                                1.3));
                              }),
                              const VSpace(Sizes.s25),
                              Text(language(context, appFonts.writeYourReview),
                                  style: appCss.dmDenseMedium14
                                      .textColor(appColor(context).darkText)),
                              const VSpace(Sizes.s12),
                              TextFieldCommon(
                                  hintText: appFonts.writeHere,
                                  minLines: 8,
                                  maxLines: 8,
                                  controller: value?.rateController,
                                  focusNode: value?.rateFocus,
                                  isNumber: true,
                                  validator: (val) =>
                                      validation.commonValidation(context, val))
                            ]).paddingAll(Insets.i20)
                      ])
                          .boxShapeExtension(
                              color: appColor(context).fieldCardBg,
                              radius: AppRadius.r12)
                          .paddingDirectional(horizontal: Insets.i20),
                      VSpace(Insets.i20),
                      BottomSheetButtonCommon(
                              textOne: appFonts.cancel,
                              textTwo: appFonts.submit,
                              applyTap: () => Provider.of<RateAppProvider>(
                                      context,
                                      listen: false)
                                  .onSubmit(
                                      context,
                                      isBusiness: true,
                                      appObjectId: businessDetail
                                          ?.business?.appObject?.appObjectId,
                                      appObjectType: businessDetail
                                          ?.business?.appObject?.appObjectType,
                                      id: businessDetail?.business?.id),
                              clearTap: () => value?.clearAll(context))
                          .backgroundColor(appColor(context).whiteColor)
                          .alignment(Alignment.bottomCenter)
                    ]))
              ])).bottomSheetExtension(context))));
        });
  }
}
