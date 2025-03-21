import 'dart:developer';

import 'package:goapp/config.dart';
import 'package:flutter/scheduler.dart';
import 'package:goapp/models/blog_filter_model.dart';

import '../../screens/app_pages_screen/search_screen/layouts/filter_layout.dart';
import 'dashboard_provider.dart';

class HomeScreenProvider with ChangeNotifier {
  int selectIndex = 0;
  int? cIndex;
  AnimationController? controller;
  Animation? animation;
  TextEditingController searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  List selectedCategory = [];

  onCategoryChange(context, id) {
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

  setState() {
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

  List<BlogFilterModel> blogFilterList = [];

  getBlogFilter({search}) async {
    blogFilterList = appArray.blogFilterList
        .map((e) => BlogFilterModel.fromJson(e))
        .toList();
    notifyListeners();
  }

  onBottomSheet(context) {
    notifyListeners();
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const FilterLayout1();
        }).then((value) {
      log("DDDD");
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      // getCategory();

      notifyListeners();
      // filterSearchCtrl.text = "";
    });
  }

  onAnimate(TickerProvider sync) {
    animationController = AnimationController(
        vsync: _TickerProvider(this), duration: const Duration(seconds: 10))
      ..repeat();
    rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController!);
    //notifyListeners();
  }

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

  onBannerTap(context, id) {
    // final commonApi = Provider.of<CommonApiProvider>(context, listen: false);
    // commonApi.getCategoryById(context, id);
  }

  onSlideBanner(index) {
    selectIndex = index;
    notifyListeners();
  }

  String getAddress(context) {
    return currentAddress ?? "";
  }

//location tap
  locationTap(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref = await SharedPreferences.getInstance();
    bool isGuest = pref.getBool(session.isContinueAsGuest) ?? false;

    if (isGuest == false) {
      animationController!.stop();
      notifyListeners();
      // final location = Provider.of<LocationProvider>(context, listen: false);
      // if (location.addressList.isEmpty) {
      //   route.pushNamed(context, routeName.location).then((e) {
      //     animationController!.reset();
      //     notifyListeners();
      //   });
    } else {
      // route.pushNamed(context, routeName.myLocation).then((e) {
      //   animationController!.reset();
      //   notifyListeners();
      // });
    }
    // } else {
    //   final dash = Provider.of<DashboardProvider>(context, listen: false);
    //
    //
    //   dash.selectIndex =0;
    //   dash.notifyListeners();
    //   route.pushAndRemoveUntil(context);
    // }
  }

  //notification tap
  notificationTap(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref = await SharedPreferences.getInstance();
    bool isGuest = pref.getBool(session.isContinueAsGuest) ?? false;
    if (isGuest == false) {
      route.pushNamed(context, routeName.notifications);
    } else {
      route.pushAndRemoveUntil(context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    notifyListeners();
    super.dispose();
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
