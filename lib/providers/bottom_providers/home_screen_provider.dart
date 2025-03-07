import 'dart:developer';

import 'package:goapp/config.dart';
import 'package:flutter/scheduler.dart';

class HomeScreenProvider with ChangeNotifier {
  int selectIndex = 0;
  int? cIndex;
  AnimationController? controller;
  Animation? animation;

  HomeScreenProvider() {
    animationController = AnimationController(
        vsync: _TickerProvider(this), duration: const Duration(seconds: 10))
      ..repeat();
    rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController!);
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
      // route.pushNamed(context, routeName.notifications);
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
