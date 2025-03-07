import 'dart:developer';

import 'package:goapp/common_tap.dart';
import 'package:goapp/screens/bottom_screens/profile_screen/profile_screen.dart'
    show ProfileScreen;
import '../../config.dart';
import '../../models/banner_model.dart';
import '../../models/index.dart';
import '../../screens/bottom_screens/booking_screen/booking_screen.dart';
import '../../screens/bottom_screens/home_screen/home_screen.dart';
import '../../screens/bottom_screens/offer_screen/offer_screen.dart';
import '../dashboard_provider/home_screen_provider.dart';
import 'home_screen_provider.dart';

class DashboardProvider with ChangeNotifier {
  List<BannerModel> bannerList = [];
  List<OfferModel> offerList = [];
  List<ProviderModel> highestRateList = [];
  List<CurrencyModel> currencyList = [];
  List<CouponModel> couponList = [];
  List<CategoryModel> categoryList = [];
  List<ServicePackageModel> servicePackagesList = [];
  List<ServicePackageModel> firstThreeServiceList = [];
  List<Services> featuredServiceList = [];
  static const pageSize = 1;
  SharedPreferences? pref;

  List<Services> firstTwoFeaturedServiceList = [];
  List<ProviderModel> firstTwoHighRateList = [];
  List<BlogModel> blogList = [];
  List<BlogModel> firstTwoBlogList = [];
  List<ProviderModel> providerList = [];
  List<BookingStatusModel> bookingStatusList = [];
  List service = appArray.servicePackageList.getRange(1, 3).toList();

  int selectIndex = 0;
  int? topSelected;
  bool isTap = false, isSearchData = false;

  final List<Widget> pages = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    // const BookingScreen(),
    // const OfferScreen(),
    // const ProfileScreen()
  ];

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  onTap(index, context) async {
    selectIndex = index;
    if (selectIndex == 3) {
      logout();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.remove(session.accessToken).then(
          (value) => route.pushReplacementNamed(context, routeName.login));

      log("logout ===> ");
    }
    if (selectIndex != 0) {
      final homeCtrl = Provider.of<HomeScreenProvider>(context, listen: false);
      homeCtrl.animationController!.stop();
      homeCtrl.notifyListeners();
    } else {
      if (selectIndex == 3) {
        // SharedPreferences preferences = await SharedPreferences.getInstance();
        // bool isGuest = preferences.getBool(session.isContinueAsGuest) ?? false;
        // if (isGuest == false) {
        //   final homeCtrl =
        //       Provider.of<HomeScreenProvider>(context, listen: false);
        //   homeCtrl.animationController!.reset();
        //   homeCtrl.notifyListeners();
        // } else {
        //   route.pushAndRemoveUntil(context);
        // }
      } else {
        final homeCtrl =
            Provider.of<HomeScreenProvider>(context, listen: false);
        homeCtrl.animationController!.reset();
        homeCtrl.notifyListeners();
      }
    }
    notifyListeners();
  }

  onInit() {
    getBanner();
    getCoupons();
    getCategory();
    getFeaturedPackage();
    getBlog();
    notifyListeners();
  }

  //banner list
  getBanner() async {
    bannerList =
        appArray.bannerList.map((e) => BannerModel.fromJson(e)).toList();
    notifyListeners();

    log("bannerList bannerList eee ${bannerList}");
  }

  //offer list
  getOffer() async {
    offerList = appArray.offerList.map((e) => OfferModel.fromJson(e)).toList();
    notifyListeners();
  }

  //highest rate provider list
  getHighestRate() async {
    highestRateList = appArray.expertServicesList
        .map((e) => ProviderModel.fromJson(e))
        .toList();
    if (highestRateList.length >= 3) {
      firstTwoHighRateList = highestRateList.getRange(0, 3).toList();
    }
    notifyListeners();
    /* try {
      await apiServices
          .getApi(api.highestRating, [], isData: true, isMessage: true)
          .then((value) {
        if (value.isSuccess!) {
          debugPrint("HIGHH :${value.data}");
          for (var data in value.data) {
            highestRateList.add(ProviderModel.fromJson(data));
            log("highestRateList :$data");
            notifyListeners();
          }
          if (highestRateList.length >= 3) {
            firstTwoHighRateList = highestRateList.getRange(0, 3).toList();
          }

          log("firstTwoHighRateList :${firstTwoHighRateList.length}");
          notifyListeners();
        }
      });
    } catch (e) {
      log("getHighestRate ::${e}");
      notifyListeners();
    }*/
  }

//currency list
  getCurrency() async {
    currencyList =
        appArray.currencyList.map((e) => CurrencyModel.fromJson(e)).toList();
    notifyListeners();
  }

//coupons list
  getCoupons() async {
    /* try {
      await apiServices.getApi(api.coupon, []).then((value) {
        if (value.isSuccess!) {
          for (var data in value.data) {
            couponList.add(CouponModel.fromJson(data));
            notifyListeners();
          }
        }
      });
    } catch (e) {
      notifyListeners();
    }*/
    couponList =
        appArray.couponList.map((e) => CouponModel.fromJson(e)).toList();
    notifyListeners();
  }

  //category list
  getCategory({search}) async {
    /* categoryList = [];
    // notifyListeners();
    try {
      String apiUrl = api.category;
      if (search != null) {
        apiUrl = "${api.category}?search=$search";
      } else {
        apiUrl = api.category;
      }

      await apiServices.getApi(apiUrl, []).then((value) {
        if (value.isSuccess!) {
          List category = value.data;
          for (var data in category.reversed.toList()) {
            if (!categoryList.contains(CategoryModel.fromJson(data))) {
              categoryList.add(CategoryModel.fromJson(data));
            }
            notifyListeners();
          }
        }
      });
    } catch (e) {
      notifyListeners();
    }*/
    categoryList =
        appArray.categoryList.map((e) => CategoryModel.fromJson(e)).toList();
    notifyListeners();
  }

  //service package list
  getServicePackage() async {
    /*  try {
      await apiServices.getApi(api.servicePackages, []).then((value) {
        if (value.isSuccess!) {
          List service = value.data;
          for (var data in service.reversed.toList()) {
            servicePackagesList.add(ServicePackageModel.fromJson(data));
            notifyListeners();
          }
          if (servicePackagesList.length >= 3) {
            firstThreeServiceList = servicePackagesList.getRange(0, 3).toList();
          }
          notifyListeners();

          log("servicePackagesList LEN: ${servicePackagesList.length}");
        }
      });
    } catch (e) {
      notifyListeners();
    }*/

    servicePackagesList = appArray.servicePackageList
        .map((e) => ServicePackageModel.fromJson(e))
        .toList();
    if (servicePackagesList.length >= 3) {
      firstThreeServiceList = servicePackagesList.getRange(0, 3).toList();
    }
    notifyListeners();
  }

  //featured package list
  getFeaturedPackage() async {
    featuredServiceList =
        appArray.featuredList.map((e) => Services.fromJson(e)).toList();
    if (featuredServiceList.length >= 2) {
      firstTwoFeaturedServiceList = featuredServiceList.getRange(0, 2).toList();
    }
    notifyListeners();
    /* featuredServiceList = [];
    firstTwoFeaturedServiceList = [];
    try {
      await apiServices.getApi(api.featuredServices, []).then((value) {
        if (value.isSuccess!) {
          List service = value.data;
          for (var data in service.reversed.toList()) {
            if (!featuredServiceList.contains(Services.fromJson(data))) {
              featuredServiceList.add(Services.fromJson(data));
            }
            notifyListeners();
          }
          if (featuredServiceList.length >= 2) {
            firstTwoFeaturedServiceList =
                featuredServiceList.getRange(0, 2).toList();
          }
          notifyListeners();
        }
      });
    } catch (e) {
      notifyListeners();
    }*/
  }

  //blog list
  getBlog() async {
    /*try {
      await apiServices.getApi(api.blog, []).then((value) {
        if (value.isSuccess!) {
          List service = value.data['data'];
          for (var data in service.reversed.toList()) {
            blogList.add(BlogModel.fromJson(data));
            notifyListeners();
          }
          if (blogList.length >= 2) {
            firstTwoBlogList = blogList.getRange(0, 2).toList();
          }
          notifyListeners();
        }
      });
    } catch (e) {
      notifyListeners();
    }*/
    blogList =
        appArray.latestBlogList.map((e) => BlogModel.fromJson(e)).toList();
    if (blogList.length >= 2) {
      firstTwoBlogList = blogList.getRange(0, 2).toList();
    }
    notifyListeners();
  }

  //provider list
  getProvider() async {
    /*  providerList = [];
    try {
      await apiServices.getApi(api.provider, []).then((value) {
        if (value.isSuccess!) {
          List provider = value.data;

          for (var data in provider.reversed.toList()) {
            log("PPPPP :$data");
            providerList.add(ProviderModel.fromJson(data));
            notifyListeners();
          }

          notifyListeners();
          log("providerList ::${providerList.length}");
        }
      });
    } catch (e) {
      notifyListeners();
    }*/
  }

  onRemoveService(context, index) {
    if (firstTwoFeaturedServiceList.isEmpty) {
      if (int.parse(featuredServiceList[index].selectedRequiredServiceMan!) ==
          1) {
        route.pop(context);
      } else {
        featuredServiceList[index].selectedRequiredServiceMan =
            (int.parse(featuredServiceList[index].selectedRequiredServiceMan!) -
                    1)
                .toString();
      }
    } else {
      if (int.parse(
              firstTwoFeaturedServiceList[index].selectedRequiredServiceMan!) ==
          1) {
        route.pop(context);
      } else {
        firstTwoFeaturedServiceList[index].selectedRequiredServiceMan =
            (int.parse(firstTwoFeaturedServiceList[index]
                        .selectedRequiredServiceMan!) -
                    1)
                .toString();
      }
    }
    notifyListeners();
  }

  onAdd(index) {
    int count =
        int.parse(featuredServiceList[index].selectedRequiredServiceMan!);
    count++;
    featuredServiceList[index].selectedRequiredServiceMan = count.toString();

    notifyListeners();
  }

  onAddTap(context, Services? service, index, inCart) {
    if (inCart) {
      // route.pushNamed(context, routeName.cartScreen);
    } else {
      // onBook(context, service!,
      //     addTap: () => onAdd(index),
      //     minusTap: () => onRemoveService(context, index)).then((e) {
      //   featuredServiceList[index].selectedRequiredServiceMan =
      //       featuredServiceList[index].requiredServicemen;
      //   notifyListeners();
      // });
    }
  }

  //booking status list
  getBookingStatus() async {
    bookingStatusList = appArray.bookingStatusList
        .map((e) => BookingStatusModel.fromJson(e))
        .toList();
    notifyListeners();
  }

  int count = 0;

  //booking history list
  getBookingHistory(context, {search, pageKey = 1}) async {
    // final booking = Provider.of<BookingProvider>(context, listen: false);
    // booking.bookingList =
    //     appArray.bookingList.map((e) => BookingModel.fromJson(e)).toList();
    // booking.notifyListeners();
  }

  onFeatured(context, Services? services, id, {inCart}) async {
    if (inCart) {
      // route.pushNamed(context, routeName.cartScreen);
    } else {
      // onBook(context, services!,
      //         addTap: () => onAdd(id),
      //         minusTap: () => onRemoveService(context, id))!
      //     .then((e) {
      //   featuredServiceList[id].selectedRequiredServiceMan =
      //       featuredServiceList[id].requiredServicemen;
      //   notifyListeners();
      // });
    }
  }

  onBannerTap(context, id) {
    // final commonApi = Provider.of<CommonApiProvider>(context, listen: false);
    // commonApi.getCategoryById(context, id);
  }

  cartTap(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isGuest = preferences.getBool(session.isContinueAsGuest) ?? false;
    if (isGuest == false) {
      /* cartCtrl.cartList = [];
                        cartCtrl.notifyListeners();*/
      // route.pushNamed(context, routeName.cartScreen);
    } else {
      route.pushAndRemoveUntil(context);
    }
  }
}
