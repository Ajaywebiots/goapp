import 'dart:async';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:goapp/config.dart';

import '../../models/api_model/app_pages_model.dart';
import '../../services/api_service.dart';

class ProfileProvider with ChangeNotifier {
  AnimationController? controller;
  Animation<Offset>? offsetAnimation;
  bool isProfileBack = false;
  SharedPreferences? preferences;

  // List<ProfileModel> profileLists = [];
  bool isPositionedRight = false;
  bool isAnimateOver = false;

  void onFloatImage() {
    notifyListeners();
  }

  Future<void> logOut(context) async {
    final profilePvr = Provider.of<ProfileDetailProvider>(context);

    profilePvr.profileImageUrl = "";
    profilePvr.txtFName.text = "";
    profilePvr.txtLName.text = "";
    profilePvr.txtEmail.text = "";
    profilePvr.txtPhone.text = "";
    profilePvr.dialCode = "";
    profilePvr.birthday.text = "";
    profilePvr.notifyListeners();




    final prefs = await SharedPreferences.getInstance();

    await Future.wait([
      prefs.remove(session.id),
      prefs.remove(session.locale),
      prefs.remove(session.accessToken),
      prefs.remove(session.isLogin),


    ]).then((value) {
      log("prefs.remove(session.id) ${prefs.remove(session.id)}");
      route.pushReplacementNamed(context, routeName.login);
    });
  }

  // onReady() {
  //   profileLists =
  //       appArray.profileList.map((e) => ProfileModel.fromJson(e)).toList();
  //   notifyListeners();
  // }

  void animateDesign(TickerProvider sync) {
    Future.delayed(DurationClass.s1).then((value) {
      isPositionedRight = true;
      notifyListeners();
    }).then((value) {
      Future.delayed(DurationClass.s2).then((value) {
        isAnimateOver = true;
        notifyListeners();
      }).then((value) {
        controller = AnimationController(
            vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
        offsetAnimation = Tween<Offset>(
                begin: const Offset(0, 0.5), end: const Offset(0, 1.7))
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        notifyListeners();
      });
    });

    notifyListeners();
  }

  void onTapSettingTap(context) {
    route.pushNamed(context, routeName.appSetting);
    notifyListeners();
  }

  //delete account
  // Future<void> deleteAccount(context) async {
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   await Future.wait([
  //     prefs.remove(session.id),
  //     prefs.remove(session.locale),
  //     prefs.remove(session.accessToken),
  //     prefs.remove(session.isLogin)
  //   ]).then((value) {
  //     log("prefs.remove(session.id) ${prefs.remove(session.id)}");
  //     route.pushReplacementNamed(context, routeName.login);
  //   });
  //
  //   notifyListeners();
  //   route.pop(context);
  //   route.pushAndRemoveUntil(context);
  //   final dash = Provider.of<DashboardProvider>(context, listen: false);
  //
  //   dash.selectIndex = 0;
  //   dash.notifyListeners();
  // }

  AppPagesModel? appPagesData;

  void appPagesAPI(context, slugValue) {
    notifyListeners();
    try {
      apiServices
          .commonApi("${api.appPages}?urlSlug=/$slugValue", [], ApiType.get,
              isToken: true)
          .then((value) {
        notifyListeners();
        log("appPagesAPI => ${value.data}");
        if (value.isSuccess == true) {
          notifyListeners();

          // if (value.data['responseStatus'] == 1) {
            notifyListeners();
            AppPagesModel appPagesModel = AppPagesModel.fromJson(value.data);
            log("appPagesAPI => $appPagesModel");
            appPagesData = appPagesModel;
            route.pushNamed(context, routeName.commonGeneralInfoLayout);
            notifyListeners();
          // }
        } else {
          log("appPagesAPI => else ${value.data}");
        }
      });
    } catch (e,s) {
      notifyListeners();
      Fluttertoast.showToast(msg: e.toString(),textColor: Colors.black);
      log("EEEE getProfileDetailDataAPI:::: $e====$s");
    }
  }
}
