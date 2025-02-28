import 'dart:async';
import 'dart:developer';

import '../../config.dart';

class SplashProvider extends ChangeNotifier {
  onReady(TickerProvider sync, context) async {
    bool isAvailable = await isNetworkConnection();
    if (isAvailable) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      Timer(
        const Duration(seconds: 3),
        () async {
          await onChangeSize();
          await Future.delayed(const Duration(seconds: 1)).then((value) {
            bool? isIntro = pref.getBool(session.isIntro) ?? false;

            Provider.of<SplashProvider>(context, listen: false).dispose();
            onDispose();
            log("isIntro::$isIntro");

            if (isIntro) {
              route.pushReplacementNamed(context, routeName.login);
            } else {
              route.pushReplacementNamed(context, routeName.onBoarding);
            }
          });
        },
      );
    } else {
      onDispose();
      Provider.of<SplashProvider>(context, listen: false).dispose();
    }
  }

//setting list

  //all category list

  bool _isDisposed = false;

  void safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  onDispose() async {
    bool isAvailable = await isNetworkConnection();
    if (!isAvailable) {}
  }

  double logoSize = 70;
  String logo = eImageAssets.appLogoWhite;
  Color backgroundColor = Color(0xff2362A8);

  onChangeSize() {
    logoSize = 300;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      backgroundColor = Colors.white;
      logo = eImageAssets.appLogo;
    });
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;

    // TODO: implement dispose
    onDispose();

    super.dispose();
  }
}
