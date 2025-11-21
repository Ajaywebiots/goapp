import 'dart:developer';
import 'package:flutter/scheduler.dart';
import 'package:goapp/config.dart';
import '../../models/api_model/business_category_model.dart';
import '../../models/api_model/home_feed_model.dart' as model;
import '../../models/api_model/home_feed_model.dart';
import '../../services/api_service.dart';

class HomeScreenProvider with ChangeNotifier {
  int selectIndex = 0;
  int? cIndex;
  AnimationController? controller;
  Animation? animation;
  TextEditingController searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  bool? isSelected;

  List selectedCategory = [];

  // Add these for category selection
  int? selectedCategoryIndex;
  Categories? selectedCategory1;

  // Method to update selected category
  void selectCategory(int index, Categories category, BuildContext context) {
    selectedCategoryIndex = index;
    selectedCategory1 = category;
    notifyListeners();

    // Fetch data for the selected category using SearchProvider
    final searchPvr = Provider.of<SearchProvider>(context, listen: false);
    searchPvr.onSubCategories(context, index, category.categoryId);
  }

  void handleBannerTap(AppObject? appObject, BuildContext context) {
    final int? type = appObject?.appObjectType;
    final int? id = appObject?.appObjectId;

    log("Tapped Banner: type=$type, id=$id");

    if (type == null) return;

    final dash = Provider.of<DashboardProvider>(context, listen: false);
    if (id == null || id == 0) {
      // Navigate to listing screen based on type
      switch (type) {
        case 2: // Business Listing
          dash.selectIndex = 1;
          notifyListeners();
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => SearchScreen()));
          break;
        case 3: // Offer Listing
          dash.selectIndex = 2;
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => CouponListScreen()));
          break;
        case 4: // Attraction Listing
          final dash = Provider.of<DashboardProvider>(context, listen: false);
          dash.selectIndex = 3;
          dash.notifyListeners(); // Ensure this is in DashboardProvider

          notifyListeners();
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => AttractionScreen()));
          break;
        case 5: // Blog Listing
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LatestBlogViewAll()));
          break;
        default:
          log("No listing screen defined for appObjectType: $type");
      }
    } else {
      // Navigate to detail via provider
      switch (type) {
        case 2: // Business
          Provider.of<SearchProvider>(context, listen: false)
              .businessDetailsAPI(context, id, isNotRouting: false);
          break;
        case 3: // Offer
          Provider.of<OfferProvider>(context, listen: false)
              .offerDetailsAPI(context, id, isNotRouting: false);
          break;
        case 4: // Attraction
          Provider.of<AttractionProvider>(context, listen: false)
              .attractionsDetailsAPI(context, id, isNotRoute: false);
          break;
        case 5: // Blog
          Provider.of<LatestBLogDetailsProvider>(context, listen: false)
              .detailsDataAPI(context, id, isNotRouting: false);
          break;
        default:
          log("Unknown appObjectType: $type");
      }
    }
  }

  /*handleBannerTap(AppObject? appObject, context) {
    final type = appObject?.appObjectType;
    final id = appObject?.appObjectId;

    log("___ $type === > $id");

    Provider.of<OfferProvider>(context, listen: false)
        .offerDetailsAPI(context, id, isNotRouting: false);

    Provider.of<SearchProvider>(context, listen: false)
        .businessDetailsAPI(context, id, isNotRouting: false);

    Provider.of<AttractionProvider>(context, listen: false)
        .attractionsDetailsAPI(context, id, isNotRoute: false);

    Provider.of<LatestBLogDetailsProvider>(context, listen: false)
        .detailsDataAPI(context, id, isNotRouting: false);

    //2 no. business
    //4 no. attraction
    //5 no. blog/articles
    //3 no. offer
  }*/

  /* Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    // Get current location
    return await Geolocator.getCurrentPosition();
  }*/

  Future<Position> getCurrentLocation() async {
    Position? lastKnown = await Geolocator.getLastKnownPosition();
    if (lastKnown != null) {
      return lastKnown;
    }

    // Fallback to full location fetching
    return await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
            accuracy: LocationAccuracy.high,
            timeLimit: Duration(milliseconds: 150)));
  }

  List<model.Banner> bannerList = [];

  // List<OfferModel> offerList = []; ////
  List<model.Offer> couponOfferList = [];

  // List<ProviderModel> highestRateList = [];
  // List<CurrencyModel> currencyList = [];

  // List<CouponModel> couponList = [];
  List<Categories> categoryList = [];
  // List<ServicePackageModel> servicePackagesList = [];
  // List<ServicePackageModel> firstThreeServiceList = [];
  // List<Services> featuredServiceList = [];

  List<model.Business> firstTwoFeaturedServiceList = [];
  List<model.Attraction> firstTwoHighRateList = [];
  List<model.Article> firstTwoBlogList = [];
  bool isLoading = false;

  Future<void> homeFeed(context) async {
    // showLoading(context);
    isLoading = true;
    Position position = await getCurrentLocation();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(session.accessToken);
    bool? isGuest = pref.getBool(session.isContinueAsGuest) ?? false;

    log("SSSSS::$token");
    try {
      apiServices
          .commonApi(
              "${api.homeFeed}?currentLongitude=${position.longitude}&currentLatitude=${position.latitude}",
              [],
              ApiType.get,
              isToken: isGuest ? false : true)
          .then((value) {
        log("isToken::");
        if (value.isSuccess == true) {
          isLoading = false;
          // hideLoading(context);
          log("ajay hariyani ${value.data}");
          isLoading = false;
          HomeFeedModel homeFeedModel = HomeFeedModel.fromJson(value.data);
          bannerList = [];
          couponOfferList = [];
          categoryList = [];
          firstTwoFeaturedServiceList = [];
          firstTwoHighRateList = [];
          // businessCategories = [];
          firstTwoBlogList = [];
          bannerList.addAll(homeFeedModel.banners as Iterable<model.Banner>);
          couponOfferList.addAll(homeFeedModel.offers);
          categoryList.addAll(homeFeedModel.categories);
          firstTwoFeaturedServiceList.addAll(homeFeedModel.businesses);
          firstTwoBlogList.addAll(homeFeedModel.articles);
          firstTwoHighRateList.addAll(homeFeedModel.attractions);
          log("Updated bannerList: ${bannerList.length} items");

          notifyListeners();
        } else {
          isLoading = false;
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      isLoading = false;
      // hideLoading(context);
      log("EEEE : homeFeed $e");
    }
  }

  void onCategoryChange(context, id) {
    log("id ddd $id");
    log("selectedCategory.length ${1 + selectedCategory.length}");
    if (!selectedCategory.contains(id)) {
      selectedCategory.add(id);
    } else {
      selectedCategory.remove(id);
    }
    log("SSS : ${selectedCategory.isEmpty}");
    notifyListeners();
  }

  HomeScreenProvider() {
    animationController = AnimationController(
        vsync: _TickerProvider(this), duration: const Duration(seconds: 10))
      ..repeat();
    rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController!);
  }

  void setState() {
    notifyListeners();
  }

  String formatDiscount(String? discount) {
    if (discount == null || discount.isEmpty) {
      return "N/A";
    }

    final parsedValue = num.tryParse(discount);
    if (parsedValue != null) {
      return "${parsedValue.round()}%";
    }

    return discount;
  }

  // List<BlogFilterModel> blogFilterList = [];

  // getBlogFilter({search}) async {
  //   blogFilterList = appArray.blogFilterList
  //       .map((e) => BlogFilterModel.fromJson(e))
  //       .toList();
  //   notifyListeners();
  // }

  // onBottomSheet(context) {
  //   notifyListeners();
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (context) {
  //         return const FilterLayout1();
  //       }).then((value) {
  //     log("DDDD");
  //     final dash = Provider.of<DashboardProvider>(context, listen: false);
  //     // getCategory();
  //
  //     notifyListeners();
  //     // filterSearchCtrl.text = "";
  //   });
  // }

  // onAnimate(TickerProvider sync) {
  //   animationController = AnimationController(
  //       vsync: _TickerProvider(this), duration: const Duration(seconds: 10))
  //     ..repeat();
  //   rotationAnimation =
  //       Tween<double>(begin: 1, end: 0).animate(animationController!);
  //   //notifyListeners();
  // }

  double turns = 0.00;
  Animation<double>? rotationAnimation;
  AnimationController? animationController;

  /* onAnimationInit(TickerProvider sync) {
    animationController =
        AnimationController(vsync: sync, duration: const Duration(seconds: 10))
          ..repeat();
    rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController!);

  }

*/

  void onBannerTap(context, id) {
    // final commonApi = Provider.of<CommonApiProvider>(context, listen: false);
    // commonApi.getCategoryById(context, id);
  }

  void onSlideBanner(index) {
    selectIndex = index;
    notifyListeners();
  }

  String getAddress(context) {
    return currentAddress ?? "";
  }

//location tap
//   locationTap(context) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref = await SharedPreferences.getInstance();
//     bool isGuest = pref.getBool(session.isContinueAsGuest) ?? false;
//
//     if (isGuest == false) {
//       animationController!.stop();
//       notifyListeners();
//       // final location = Provider.of<LocationProvider>(context, listen: false);
//       // if (location.addressList.isEmpty) {
//       //   route.pushNamed(context, routeName.location).then((e) {
//       //     animationController!.reset();
//       //     notifyListeners();
//       //   });
//     } else {
//       // route.pushNamed(context, routeName.myLocation).then((e) {
//       //   animationController!.reset();
//       //   notifyListeners();
//       // });
//     }
//     // } else {
//     //   final dash = Provider.of<DashboardProvider>(context, listen: false);
//     //
//     //
//     //   dash.selectIndex =0;
//     //   dash.notifyListeners();
//     //   route.pushAndRemoveUntil(context);
//     // }
//   }

  //notification tap
  Future<void> notificationTap(context) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // pref = await SharedPreferences.getInstance();
    // bool isGuest = pref.getBool(session.isContinueAsGuest) ?? false;
    // if (isGuest == false) {
      route.pushNamed(context, routeName.notifications);
    // } else {
    //   route.pushAndRemoveUntil(context);
    // }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    notifyListeners();
    super.dispose();
  }

  void viewAllOnTap(context) {
    final dash = Provider.of<DashboardProvider>(context, listen: false);
    dash.selectIndex = 2;
    notifyListeners();
  }
}

class _TickerProvider extends TickerProvider {
  final HomeScreenProvider _notifier;

  _TickerProvider(this._notifier);

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick, debugLabel: 'ticker');
  }
}
