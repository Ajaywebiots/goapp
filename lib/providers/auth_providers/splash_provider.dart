import 'dart:async';
import 'dart:developer';
import 'package:goapp/common/session.dart';
import '../../config.dart';
import '../../services/api_service.dart';

class SplashProvider extends ChangeNotifier {
  double logoSize = 70;
  String logo = eImageAssets.appLogoWhite;
  Color backgroundColor = const Color(0xff2362A8);

  Future<void> onReady(TickerProvider sync, context) async {
    final isAvailable = await isNetworkConnection();
    if (!isAvailable) return;

    // Fetch onboarding data
    await Provider.of<OnBoardingProvider>(
      context,
      listen: false,
    ).onBoardingDetails();

    final pref = await SharedPreferences.getInstance();

    // Read onboarding & token data
    final bool isIntro = pref.getBool(Session.isIntro) ?? false;
    final String? token = pref.getString(session.accessToken);
    final String? expirationString = pref.getString(session.tokenExpiration);

    log("expirationString $expirationString");

    // Check token validity
    bool isTokenValid = false;
    if (token != null && expirationString != null) {
      final expirationTime = DateTime.parse(expirationString);
      isTokenValid = expirationTime.isAfter(DateTime.now());

      log("Current Time: ${DateTime.now()}");
      log("Token Expiry: $expirationTime");
      log("Token Valid: $isTokenValid");
    }

    // Play splash animation timing
    Timer(const Duration(seconds: 3), () async {
      onChangeSize();
      await Future.delayed(const Duration(seconds: 1));

      // Navigate based on intro + token
      if (!isIntro) {
        route.pushReplacementNamed(context, routeName.onBoarding);
        return;
      }

      if (isTokenValid) {
        // Preload API calls
        final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
        final searchPvr = Provider.of<SearchProvider>(context, listen: false);
        final attractionPvr = Provider.of<AttractionProvider>(
          context,
          listen: false,
        );
        final offerPvr = Provider.of<OfferProvider>(context, listen: false);
        final catListPvr = Provider.of<CategoriesListProvider>(
          context,
          listen: false,
        );

        Provider.of<LatestBLogDetailsProvider>(
          context,
          listen: false,
        ).getArticlesSearchAPI(context);
        Provider.of<ProfileDetailProvider>(
          context,
          listen: false,
        ).getProfileDetailDataAPI(context);

        homePvr.homeFeed(context);
        searchPvr.getBusinessSearchAPI(context, isFilter: false);
        attractionPvr.getAttractionSearchAPI(context);
        offerPvr.getViewAllOfferAPI();
        catListPvr.getCategoriesData(context);
        offerPvr.getCategoriesData(context);

        route.pushReplacementNamed(context, routeName.dashboard);
      } else {
        route.pushReplacementNamed(context, routeName.login);
        showMessage("Session expired. Please login again.");
        pref.remove(session.id);
        pref.remove(session.locale);
        pref.remove(session.accessToken);
        pref.remove(session.isLogin);
        pref.remove(session.loginSession);
        pref.remove(session.tokenExpiration);
        pref.remove(session.locale);
      }
    });
  }

  // After onboarding complete → set intro true
  void completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Session.isIntro, true);
    log("Onboarding completed → isIntro = true");

    route.pushReplacementNamed(context, routeName.login);
  }

  // Animation logic (unchanged)
  void onChangeSize() {
    logoSize = 300;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      backgroundColor = Colors.white;
      logo = eImageAssets.appLogo;
      notifyListeners();
    });
  }
}
