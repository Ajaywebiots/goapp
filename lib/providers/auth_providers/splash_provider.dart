import 'dart:async';
import 'dart:developer';

import 'package:goapp/providers/app_pages_provider/attractions_provider.dart';
import 'package:goapp/providers/app_pages_provider/categories_list_provider.dart';
import 'package:goapp/providers/app_pages_provider/search_provider.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';
import 'package:goapp/providers/bottom_providers/offer_provider.dart';

import '../../config.dart';

class SplashProvider extends ChangeNotifier {
  onReady(TickerProvider sync, context) async {
    bool isAvailable = await isNetworkConnection();
    if (isAvailable) {
      Provider.of<OnBoardingProvider>(context, listen: false)
          .onBoardingDetails();
      SharedPreferences pref = await SharedPreferences.getInstance();

      Timer(const Duration(seconds: 3), () async {
        await onChangeSize();
        await Future.delayed(const Duration(seconds: 1)).then((value) {
          bool? isIntro = pref.getBool(session.isIntro) ?? false;
          String? token = pref.getString(session.accessToken);
          String? expirationString = pref.getString(session.tokenExpiration);

          log("access token::: $token");
          log("expirationString::: $expirationString");
          Provider.of<SplashProvider>(context, listen: false).dispose();
          onDispose();
          log("isIntro::$isIntro");
          final homePvr =
              Provider.of<HomeScreenProvider>(context, listen: false);
          final searchPvr = Provider.of<SearchProvider>(context, listen: false);
          final attractionPvr =
              Provider.of<AttractionProvider>(context, listen: false);
          final offerPvr = Provider.of<OfferProvider>(context, listen: false);
          final catListPvr =
              Provider.of<CategoriesListProvider>(context, listen: false);

          bool isTokenValid = false;
          if (token != null && expirationString != null) {
            DateTime expirationTime = DateTime.parse(expirationString);
            isTokenValid = expirationTime.isAfter(DateTime.now());
          }

          if (isIntro) {
            if (token != null && isTokenValid) {
              homePvr.homeFeed(context);
              searchPvr.getBusinessSearchAPI(context, isFilter: false);
              attractionPvr.getAttractionSearchAPI(context);
              offerPvr.getViewAllOfferAPI();
              catListPvr.getCategoriesData(context);
              offerPvr.getCategoriesData(context);
              route.pushReplacementNamed(context, routeName.dashboard);
            } else {
              route.pushReplacementNamed(context, routeName.login);
            }
          } else {
            route.pushReplacementNamed(context, routeName.onBoarding);
          }
        });
      });
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
