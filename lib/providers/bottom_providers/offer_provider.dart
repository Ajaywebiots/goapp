import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:goapp/config.dart';
import 'package:goapp/services/api_service.dart';

import '../../models/api_model/home_feed_model.dart';
import '../../models/api_model/offer_categories_model.dart';
import '../../models/api_model/offer_search_model.dart';
import '../../models/api_model/offers_details_model.dart';
import '../../screens/app_pages_screen/coupon_list_screen/coupon_list_screen.dart';

class OfferProvider extends ChangeNotifier {
  onReady() {
    getViewAllOfferAPI();
    notifyListeners();
  }

  double slider = 0.0;

  slidingValue(newValue) {
    log("slide $slider");
    log("slidnewValuee $newValue");
    slider = newValue;
    notifyListeners();
  }

  bool isNavigating = false;

  List type = [];
  List selectedCategory = [];

  getCategoriesData(context) {
    // showLoading(context);
    notifyListeners();
    try {
      apiServices.commonApi(api.offerCategories, [], ApiType.get).then((value) {
        if (value.isSuccess == true) {
          categoryList.clear();
          if (value.data['responseStatus'] == 1) {
            notifyListeners();

            log("API Response: attractionCategories ${value.data}");
            OfferCategoriesModel categoryModel =
                OfferCategoriesModel.fromJson(value.data);

            // Clear old list and add new parsed categories

            notifyListeners();
            categoryList.addAll(categoryModel.categories as List<Categories>);

            log("categoryList offers ${categoryList}");
            // hideLoading(context);
            notifyListeners();
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      // hideLoading(context);
      log("getCategoriesData $e");
    }
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

  int selectIndex = 0;

  onFilter(index) {
    selectIndex = index;
    notifyListeners();
  }

  List<Categories> categoryList = [];

/*  searchService(BuildContext context, {bool isPop = false}) async {
    */ /* final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
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
        // "currentLongitude": lon,
        // "currentLatitude": lat
      };

      Uri url = buildUriWithRepeatedKeys(api.businessSearch, queryParams);

      log("Final API URL: $url");

      apiServices.commonApi(url, [], ApiType.get, isToken: true).then((value) {
        if (value.data['responseStatus'] == 1) {
          // hideLoading(context);
          businessSearchList.clear();
          notifyListeners();
          BusinessSearchModel businessSearchModel =
          BusinessSearchModel.fromJson(value.data);
          notifyListeners();
          businessSearchList.addAll(businessSearchModel.businesses);
          notifyListeners();
          log("businessSearchList $businessSearchList");
        }
      });

      if (isPop) {
        route.pop(context);
      }
    } catch (e) {
      log("searchService error: $e");
    }*/ /*
  }*/

  TextEditingController searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  Timer? debounceTimer;

  OfferProvider() {
    searchCtrl.addListener(onSearchChange);
  }

  String totalCountFilter() {
    int typeCount = selectedOfferTypeIds.length;
    int distanceCount = (slider != 0.0) ? 1 : 0;

    int total = typeCount + distanceCount;

    log('type Count: $typeCount');
    log('Distance Count: $distanceCount');
    log('Total Filter Count: $total');

    return total.toString();
  }

  void onSearchChange() {
    if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();
    log("rrrrr ssss${searchCtrl.text}");
    // Start a new debounce timer
    debounceTimer = Timer(Duration(milliseconds: 500), () {
      final query = searchCtrl.text.trim();
      log("rrrrr $query");
      if (query.isEmpty) {
        onReady();
      } else if (query.length >= 3) {
        fetchSearchResults(query);
      }
    });
  }

  List<Offer> offerViewAllList = [];

  void fetchSearchResults(String query) {
    try {
      apiServices
          .commonApi("${api.offerSearch}?name=$query", [], ApiType.get,
              isToken: true)
          .then((value) {
        if (value.data['responseStatus'] == 1) {
          offerViewAllList.clear();
          OfferSearchModel offerSearchModel =
              OfferSearchModel.fromJson(value.data);
          offerViewAllList.addAll(offerSearchModel.offers as List<Offer>);
          notifyListeners();
        }
      });
    } catch (e) {
      log("Search error: $e");
    }
  }

  List<int> selectedOfferTypeIds = [];

  int selectedTab = 0;

  // using model OfferType

  double selectedDistance = 30.0;
  Dio? dio;

  void clearAll(context) {
    selectedOfferTypeIds.clear();
    slider = 0.0;
    getViewAllOfferAPI();
    route.pop(context);
  }

  getViewAllOfferAPI() {
    notifyListeners();
    try {
      apiServices
          .commonApi(api.offerSearch, [], ApiType.get, isToken: true)
          .then((value) {
        notifyListeners();
        if (value.isSuccess == true) {
          offerViewAllList.clear();
          if (value.data['responseStatus'] == 1) {
            OfferSearchModel offerSearchModel =
                OfferSearchModel.fromJson(value.data);
            notifyListeners();
            offerViewAllList.addAll(offerSearchModel.offers as List<Offer>);
            fetchOfferTypes();
            notifyListeners();
          }
        }
      });
    } catch (e) {
      log("getViewAllOfferAPI :: $e");
    }
    notifyListeners();
  }

  bool isLoading = false;
  List<OfferType> offerTypes = [];

  Future<void> fetchOfferTypes() async {
    notifyListeners();
    isLoading = true;

    final response =
        await apiServices.commonApi(api.offerType, [], ApiType.get);
    if (response.data['responseStatus'] == 1) {
      final offerCategoryModel = OfferCategoryModel.fromJson(response.data);
      offerTypes = offerCategoryModel.offerTypes;
    }
    notifyListeners();
    isLoading = false;
  }

  OfferDetailsModel? offersDetails;

  offerDetailsAPI(context, id, {bool? isNotRouting = false}) {
    if (isNavigating) return;
    isNavigating = true;

    notifyListeners();
    try {
      apiServices
          .commonApi("${api.offersDetails}$id/details", [], ApiType.get,
              isToken: true)
          .then((value) {
        if (value.isSuccess! && value.data['responseStatus'] == 1) {
          OfferDetailsModel offersDetailsModel =
              OfferDetailsModel.fromJson(value.data);
          offersDetails = offersDetailsModel;
          notifyListeners();

          if (isNotRouting != true) {
            route.pushNamed(context, routeName.offerDetailsScreen);
          }
        }
        isNavigating = false;
      }).catchError((error) {
        isNavigating = false;
        log("API Error: $error");
      });
    } catch (e) {
      isNavigating = false;
      log("Search error: $e");
    }
  }

  @override
  void dispose() {
    debounceTimer?.cancel();
    searchCtrl.dispose();
    searchFocus.dispose();
    super.dispose();
  }
}
