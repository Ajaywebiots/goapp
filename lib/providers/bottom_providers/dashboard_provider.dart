import 'package:goapp/screens/app_pages_screen/coupon_list_screen/coupon_list_screen.dart';
import 'package:goapp/screens/app_pages_screen/search_screen/search_screen.dart';
import 'package:goapp/screens/menu_screens/menu_screen.dart';

import '../../config.dart';
import '../../models/index.dart';
import '../../screens/app_pages_screen/attractions_screen/attractions_screen.dart';
import '../../screens/bottom_screens/home_screen/home_screen.dart';
import '../app_pages_provider/profile_detail_provider.dart';
import 'home_screen_provider.dart';

class DashboardProvider with ChangeNotifier {
  static const pageSize = 1;
  SharedPreferences? pref;
  bool isFav = false;

  TextEditingController searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  // List<Category> businessCategories = [];

  // List<BlogModel> blogList = [];

  // List<BlogModel> firstTwoBlogList = [];
  List<ProviderModel> providerList = [];
  List<BookingStatusModel> bookingStatusList = [];
  List service = appArray.servicePackageList.getRange(1, 3).toList();

  int selectIndex = 0;
  int? topSelected;
  bool isTap = false, isSearchData = false;

  final List<Widget> pages = [
    const HomeScreen(),
    SearchScreen(isHomeScreen: true),
    AttractionScreen(isHomeScreen: true),
    CouponListScreen(isHomeScreen: true),
    MenuScreen()
  ];

  onInit(context) {
    Provider.of<ProfileDetailProvider>(context, listen: false)
        .getProfileDetailDataAPI(context);
    // final login = Provider.of<LoginProvider>(context, listen: false);
    // login.locationPermission();
    // getCurrentLocation();
    // homeFeed(context);
    // final searchAllList = Provider.of<SearchProvider>(context, listen: false);
    // searchAllList.getBusinessSearchAPI(context);
    // final blogViewAllList =
    //     Provider.of<LatestBLogDetailsProvider>(context, listen: false);
    // final attractionViewAllList =
    //     Provider.of<AttractionProvider>(context, listen: false);
    // attractionViewAllList.getAttractionSearchAPI(context);
    // blogViewAllList.getArticlesSearchAPI(context);
    // notifyListeners();
    // final homeScreenPvr =
    //     Provider.of<HomeScreenProvider>(context, listen: false);
    //
    // homeScreenPvr.getBlogFilter();
  }

  void refreshData() {
    notifyListeners();
  }

  onTap(index, context) async {
    selectIndex = index;

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

  //banner list
  // getBanner() async {
  //   // bannerList = appArray.bannerList.map((e) => BannerModel.fromJson(e)).toList();
  //   bannerList = appArray.bannerList.map((e) => TopBanner.fromJson(e)).toList();
  //   notifyListeners();
  //
  //   log("bannerList bannerList eee $bannerList");
  // }

  //offer list
  // getOffer() async {
  //   offerList = appArray.offerList.map((e) => OfferModel.fromJson(e)).toList();
  //   notifyListeners();
  // }

  //highest rate provider list
  // getHighestRate() async {
  //   highestRateList = appArray.featureAttractions
  //       .map((e) => ProviderModel.fromJson(e))
  //       .toList();
  //   if (highestRateList.length >= 3) {
  //     firstTwoHighRateList = highestRateList.getRange(0, 3).toList();
  //   }
  //   notifyListeners();
  //   /* try {
  //     await apiServices
  //         .getApi(api.highestRating, [], isData: true, isMessage: true)
  //         .then((value) {
  //       if (value.isSuccess!) {
  //         debugPrint("HIGHH :${value.data}");
  //         for (var data in value.data) {
  //           highestRateList.add(ProviderModel.fromJson(data));
  //           log("highestRateList :$data");
  //           notifyListeners();
  //         }
  //         if (highestRateList.length >= 3) {
  //           firstTwoHighRateList = highestRateList.getRange(0, 3).toList();
  //         }
  //
  //         log("firstTwoHighRateList :${firstTwoHighRateList.length}");
  //         notifyListeners();
  //       }
  //     });
  //   } catch (e) {
  //     log("getHighestRate ::${e}");
  //     notifyListeners();
  //   }*/
  // }

//currency list
//   getCurrency() async {
//     currencyList =
//         appArray.currencyList.map((e) => CurrencyModel.fromJson(e)).toList();
//     notifyListeners();
//   }

//coupons list
//   getCoupons() async {
//     /* try {
//       await apiServices.getApi(api.coupon, []).then((value) {
//         if (value.isSuccess!) {
//           for (var data in value.data) {
//             couponList.add(CouponModel.fromJson(data));
//             notifyListeners();
//           }
//         }
//       });
//     } catch (e) {
//       notifyListeners();
//     }*/
//     couponList =
//         appArray.couponList.map((e) => CouponModel.fromJson(e)).toList();
//     notifyListeners();
//   }

  //category list
  // getCategory({search}) async {
  //   /* categoryList = [];
  //   // notifyListeners();
  //   try {
  //     String apiUrl = api.category;
  //     if (search != null) {
  //       apiUrl = "${api.category}?search=$search";
  //     } else {
  //       apiUrl = api.category;
  //     }
  //
  //     await apiServices.getApi(apiUrl, []).then((value) {
  //       if (value.isSuccess!) {
  //         List category = value.data;
  //         for (var data in category.reversed.toList()) {
  //           if (!categoryList.contains(CategoryModel.fromJson(data))) {
  //             categoryList.add(CategoryModel.fromJson(data));
  //           }
  //           notifyListeners();
  //         }
  //       }
  //     });
  //   } catch (e) {
  //     notifyListeners();
  //   }*/
  //   // categoryList =
  //   //     appArray.categoryList.map((e) => CategoryModel.fromJson(e)).toList();
  //   notifyListeners();
  // }

  //service package list
  // getServicePackage() async {
  //   /*  try {
  //     await apiServices.getApi(api.servicePackages, []).then((value) {
  //       if (value.isSuccess!) {
  //         List service = value.data;
  //         for (var data in service.reversed.toList()) {
  //           servicePackagesList.add(ServicePackageModel.fromJson(data));
  //           notifyListeners();
  //         }
  //         if (servicePackagesList.length >= 3) {
  //           firstThreeServiceList = servicePackagesList.getRange(0, 3).toList();
  //         }
  //         notifyListeners();
  //
  //         log("servicePackagesList LEN: ${servicePackagesList.length}");
  //       }
  //     });
  //   } catch (e) {
  //     notifyListeners();
  //   }*/
  //
  //   servicePackagesList = appArray.servicePackageList
  //       .map((e) => ServicePackageModel.fromJson(e))
  //       .toList();
  //   if (servicePackagesList.length >= 3) {
  //     firstThreeServiceList = servicePackagesList.getRange(0, 3).toList();
  //   }
  //   notifyListeners();
  // }

  //featured package list
  // getFeaturedPackage(page) async {
  //   featuredServiceList =
  //       appArray.featuredList.map((e) => Services.fromJson(e)).toList();
  //   if (featuredServiceList.length >= 2) {
  //     // firstTwoFeaturedServiceList = featuredServiceList.getRange(0, 2).toList();
  //   }
  //   notifyListeners();
  //   /* featuredServiceList = [];
  //   firstTwoFeaturedServiceList = [];
  //   try {
  //     await apiServices.getApi(api.featuredServices, []).then((value) {
  //       if (value.isSuccess!) {
  //         List service = value.data;
  //         for (var data in service.reversed.toList()) {
  //           if (!featuredServiceList.contains(Services.fromJson(data))) {
  //             featuredServiceList.add(Services.fromJson(data));
  //           }
  //           notifyListeners();
  //         }
  //         if (featuredServiceList.length >= 2) {
  //           firstTwoFeaturedServiceList =
  //               featuredServiceList.getRange(0, 2).toList();
  //         }
  //         notifyListeners();
  //       }
  //     });
  //   } catch (e) {
  //     notifyListeners();
  //   }*/
  // }

  //blog list
  // getBlog() async {
  //   /*try {
  //     await apiServices.getApi(api.blog, []).then((value) {
  //       if (value.isSuccess!) {
  //         List service = value.data['data'];
  //         for (var data in service.reversed.toList()) {
  //           blogList.add(BlogModel.fromJson(data));
  //           notifyListeners();
  //         }
  //         if (blogList.length >= 2) {
  //           firstTwoBlogList = blogList.getRange(0, 2).toList();
  //         }
  //         notifyListeners();
  //       }
  //     });
  //   } catch (e) {
  //     notifyListeners();
  //   }*/
  //   blogList =
  //       appArray.latestBlogList.map((e) => BlogModel.fromJson(e)).toList();
  //   if (blogList.length >= 2) {
  //     firstTwoBlogList = blogList.getRange(0, 2).toList();
  //   }
  //   notifyListeners();
  // }

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

  // onRemoveService(context, index) {
  //   if (firstTwoFeaturedServiceList.isEmpty) {
  //     if (int.parse(featuredServiceList[index].selectedRequiredServiceMan!) ==
  //         1) {
  //       route.pop(context);
  //     } else {
  //       featuredServiceList[index].selectedRequiredServiceMan =
  //           (int.parse(featuredServiceList[index].selectedRequiredServiceMan!) -
  //                   1)
  //               .toString();
  //     }
  //   } else {
  //     if (int.parse(
  //             firstTwoFeaturedServiceList[index].selectedRequiredServiceMan!) ==
  //         1) {
  //       route.pop(context);
  //     } else {
  //       firstTwoFeaturedServiceList[index].selectedRequiredServiceMan =
  //           (int.parse(firstTwoFeaturedServiceList[index]
  //                       .selectedRequiredServiceMan!) -
  //                   1)
  //               .toString();
  //     }
  //   }
  //   notifyListeners();
  // }

  // onAdd(index) {
  //   int count =
  //       int.parse(featuredServiceList[index].selectedRequiredServiceMan!);
  //   count++;
  //   featuredServiceList[index].selectedRequiredServiceMan = count.toString();
  //
  //   notifyListeners();
  // }

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

  // //booking history list
  // getBookingHistory(context, {search, pageKey = 1}) async {
  //   // final booking = Provider.of<BookingProvider>(context, listen: false);
  //   // booking.bookingList =
  //   //     appArray.bookingList.map((e) => BookingModel.fromJson(e)).toList();
  //   // booking.notifyListeners();
  // }

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
