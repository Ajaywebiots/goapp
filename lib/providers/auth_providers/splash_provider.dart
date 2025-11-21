import 'dart:async';
import 'dart:developer';
import 'package:goapp/common/session.dart';

import '../../config.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> onReady(TickerProvider sync, context) async {
    bool isAvailable = await isNetworkConnection();
    if (isAvailable) {
     await Provider.of<OnBoardingProvider>(context, listen: false)
          .onBoardingDetails();
      SharedPreferences pref = await SharedPreferences.getInstance();

      Timer(const Duration(seconds: 3), () async {
        onChangeSize();
        await Future.delayed(const Duration(seconds: 1)).then((value) {
          bool isIntro = pref.getBool(Session.isIntro) ?? false;
          log("isIntro::$isIntro");
          String? token = pref.getString(session.accessToken);
          String? expirationString = pref.getString(session.tokenExpiration);
          Provider.of<SplashProvider>(context, listen: false).dispose();
          onDispose();

          bool isTokenValid = false;
          if (token != null && expirationString != null) {
            DateTime expirationTime = DateTime.parse(expirationString);
            isTokenValid = expirationTime.isAfter(DateTime.now());
          }

          if (!isIntro) {
            route.pushReplacementNamed(context, routeName.onBoarding);
            return;
          }

          if (token != null && isTokenValid) {
            final homePvr =
            Provider.of<HomeScreenProvider>(context, listen: false);
            final searchPvr =
            Provider.of<SearchProvider>(context, listen: false);
            final attractionPvr =
            Provider.of<AttractionProvider>(context, listen: false);
            final offerPvr = Provider.of<OfferProvider>(context, listen: false);
            final catListPvr =
            Provider.of<CategoriesListProvider>(context, listen: false);
            Provider.of<LatestBLogDetailsProvider>(context, listen: false)
                .getArticlesSearchAPI(context);
            Provider.of<ProfileDetailProvider>(context, listen: false)
                .getProfileDetailDataAPI(context);

            homePvr.homeFeed(context);
            searchPvr.getBusinessSearchAPI(context, isFilter: false);
            attractionPvr.getAttractionSearchAPI(context);
            offerPvr.getViewAllOfferAPI();
            catListPvr.getCategoriesData(context);
            offerPvr.getCategoriesData(context);

            route.pushReplacementNamed(context, routeName.dashboard);
          } else {
            route.pushReplacementNamed(context, routeName.dashboard);
          }
        });
      });
    } else {
      onDispose();
      Provider.of<SplashProvider>(context, listen: false).dispose();
    }
  }

  void completeOnboarding(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(Session.isIntro, true);
    log("Onboarding completed → session.isIntro set to TRUE");

    route.pushReplacementNamed(context, routeName.login);
    log("Navigated to: ${routeName.login}");
  }



  bool _isDisposed = false;

  void safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<void> onDispose() async {
    bool isAvailable = await isNetworkConnection();
    if (!isAvailable) {}
  }

  double logoSize = 70;
  String logo = eImageAssets.appLogoWhite;
  Color backgroundColor = Color(0xff2362A8);

  void onChangeSize() {
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
