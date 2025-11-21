import 'dart:developer';

import '../../config.dart';

class DashboardProvider with ChangeNotifier {
  static const pageSize = 1;
  SharedPreferences? pref;
  bool isFav = false;
  int previousTabIndex = 0;
  String? previousRoute;
  TextEditingController searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  List service = appArray.servicePackageList.getRange(1, 3).toList();

  int selectIndex = 0;

  int? topSelected;
  bool isTap = false, isSearchData = false;

  final List<Widget> pages = [
    const HomeScreen(),
    SearchScreen(isHomeScreen: true, selectedIndex: -1),
    CouponListScreen(isHomeScreen: true),
    AttractionScreen(isHomeScreen: true),
    MenuScreen(isHomeScreen: true)
  ];

  bool cameFromProfileSubPage = false;

  void goToTabFromProfile(int index, BuildContext context) {
    cameFromProfileSubPage = true;
    selectIndex = index;
    notifyListeners();
  }

  void onInit(context) {
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

  bool isInCategoryListing = false;
  bool isBack = false;
  void onTap(int index, BuildContext context) {
    if (isInCategoryListing) {
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context);
      }
      isInCategoryListing = false;

      Future.delayed(Duration(milliseconds: 0), () {
        selectIndex = index;
        notifyListeners();
      });
    } else {
      selectIndex = index;
      if (index == 1) {
        isBack = true;
        log("message=-=-=-=-=-=-=-=-=-$isBack");
        notifyListeners();
      }
      notifyListeners();
    }
  }


}
