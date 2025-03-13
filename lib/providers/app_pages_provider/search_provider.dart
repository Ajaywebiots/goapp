import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:fixit_user_uikit/config.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

import '../../common_tap.dart';

class SearchProvider with ChangeNotifier {
  AnimationController? animationController;
  SharedPreferences? pref;
  TextEditingController searchCtrl = TextEditingController();
  TextEditingController filterSearchCtrl = TextEditingController();
  List<CategoryModel> categoryList = [];
  Future<ui.Image>? loadingImage;
  final FocusNode searchFocus = FocusNode();
  final FocusNode filterSearchFocus = FocusNode();
  List selectedCategory = [];
  List selectedRates = [];
  List<Services> searchList = [];
  List<Services> recentSearchList = [];

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
    ByteData data = await rootBundle.load(
      assetPath,
    );
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
    slider = newValue;
    notifyListeners();
  }

  int selectCategoryIndex = 0;
  int selectIndex = 0;

  onFilter(index) {
    selectIndex = index;
    notifyListeners();
  }

  onAnimate(context, TickerProvider sync) async {
    pref = await SharedPreferences.getInstance();

    notifyListeners();
    getRecentSearch();
    animationController = AnimationController(
        vsync: sync, duration: const Duration(milliseconds: 1200));
    _runAnimation();
    FrameInfo fi = await loadImage(eImageAssets.userSlider);
    customImage = fi.image;
    final dashCtrl = Provider.of<DashboardProvider>(context, listen: false);
    categoryList = dashCtrl.categoryList;
    recentSearchList = appArray.recentSearch.map((e) => Services.fromJson(e)).toList();
    notifyListeners();
    log("CATEG :${categoryList.length}");
  }

  getRecentSearch() {
    dynamic save = pref!.getString(session.recentSearch);
    log("PREE :$save");
    if (save != null) {
      final List<dynamic> jsonData =
          jsonDecode(pref!.getString(session.recentSearch) ?? '[]');
      log("jsonData :${jsonData.length}");
      recentSearchList = jsonData.map<Services>((jsonList) {
        return Services.fromJson(jsonList);
      }).toList();
      notifyListeners();
    }
  }

  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
  }

  onBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const FilterLayout();
      },
    ).then((value) {
      log("DDDD");
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      getCategory();

      dash.notifyListeners();
      filterSearchCtrl.text = "";
    });
  }

  //category list
  getCategory({search}) async {
    categoryList = appArray.categoryList.map((e) => CategoryModel.fromJson(e)).toList();
    notifyListeners();
  }

  onCategoryChange(context, id) {
    if (!selectedCategory.contains(id)) {
      selectedCategory.add(id);
    } else {
      selectedCategory.remove(id);
    }
    log("SSS : ${selectedCategory.isEmpty}");
    notifyListeners();
  }

  String totalCountFilter() {
    int count = 0;
    if (selectedCategory.isNotEmpty) {
      count++;
    }
    if ((lowerVal != 00.0 || upperVal != maxPrice) &&
        (lowerVal != 00.0 || upperVal != 100.0)) {
      count++;
    }
    if (selectedRates.isNotEmpty) {
      count++;
    }
    if (slider != 0.0) {
      count++;
    }

    if (isSelect != null) {
      count++;
    }
    return count.toString();
  }

  //clear filter
  clearFilter(context) {
    selectedCategory = [];
    selectedRates = [];
    searchList = [];
    lowerVal = 0.0;
    upperVal = maxPrice;
    slider = 0;
    final dashCtrl = Provider.of<DashboardProvider>(context, listen: false);
    categoryList = dashCtrl.categoryList;
    route.pop(context);
    notifyListeners();
  }

  // search list
  searchService(context, {isPop = false}) async {
    if (isPop) {
      route.pop(context);
    }

    /* final locationProvider =
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
    }*/
    searchList = [];

    List<Services> serviceList = appArray.servicesList.map((e) => Services.fromJson(e)).toList();
    for(var search in serviceList){
      log("search.title!. :${search.title!} // ${searchCtrl.text}");
      if(search.title!.toLowerCase().replaceAll(" ", "").contains(searchCtrl.text)){
        searchList.add(search);
      }
      notifyListeners();
    }
    if (searchList.isNotEmpty) {
      isSearch = false;
    } else {
      isSearch = true;
    }
  }

  searchClear() {
    searchCtrl.text = "";
    isSearch = false;
    notifyListeners();
  }

  onFeatured(context, Services? services, id, {inCart}) async {
    if (inCart) {
      route.pop(context);
      route.pushNamed(context, routeName.cartScreen);
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
      log("jsonData :${saveList.length}");
      if (saveList.length == 5) {
        saveList.removeAt(0);
        saveList.add(services!);
      } else {
        int ind = saveList.indexWhere((element) => services!.id == element.id);
        log("ind:$ind");
        if (ind < 0) {
          saveList.add(services!);
        }
      }
    }

    recentSearchList = saveList;

    log("recentSearchList :$recentSearchList");

    pref!.setString(session.recentSearch, jsonEncode(saveList));
    notifyListeners();
    route.pushNamed(context, routeName.servicesDetailsScreen,
        arg: services!.id);
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

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
