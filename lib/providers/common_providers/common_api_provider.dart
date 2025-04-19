import 'dart:developer';

import 'package:goapp/config.dart';
import 'package:goapp/providers/app_pages_provider/attractions_provider.dart';
import 'package:goapp/providers/app_pages_provider/latest_blog_details_provider.dart';
import 'package:goapp/providers/app_pages_provider/search_provider.dart';
import 'package:goapp/providers/bottom_providers/dashboard_provider.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';
import 'package:goapp/providers/bottom_providers/offer_provider.dart';
import 'package:goapp/services/api_service.dart';

class CommonApiProvider extends ChangeNotifier {
  Future<void> toggleFavAPI(
      context, isFavorite, int? appObjectType, int? appObjectId,
      {VoidCallback? onSuccess}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);
    notifyListeners();
    if (userId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("User not logged in")));
      return;
    }
    notifyListeners();
    try {
      if (isFavorite) {
        log("Remove from favorites $isFavorite");
        // Remove from favorites
        final response = await apiServices.commonApi(
            "${api.removeFav}$userId/favorites/$appObjectType/$appObjectId",
            [],
            ApiType.delete,
            isToken: true);
        log("Removed from favorites: ${response.data}");
        notifyListeners();
      } else {
        log("Add to favorites $isFavorite");
        // Add to favorites
        final response = await apiServices.commonApi(
            "${api.addFav}$userId/favorites/$appObjectType/$appObjectId",
            [],
            ApiType.post,
            isToken: true);
        log("Added to favorites: ${response.data}");
        notifyListeners();
      }

      notifyListeners();
      if (onSuccess != null) {
        onSuccess();
      }

      // final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
      // final offerPvr = Provider.of<OfferProvider>(context, listen: false);
      // final attraction =
      //     Provider.of<AttractionProvider>(context, listen: false);
      // final business = Provider.of<SearchProvider>(context, listen: false);
      // final blogPvr =
      //     Provider.of<LatestBLogDetailsProvider>(context, listen: false);
      //
      // attraction.getAttractionSearchAPI(context);
      // homePvr.homeFeed(context);
      // offerPvr.getViewAllOfferAPI();
      // business.businessDetailsAPI(context, havingId, isNotRouting: true);
      // blogPvr.detailsDataAPI(context, havingId);
      // blogPvr.getArticlesSearchAPI(context);
      notifyListeners();
    } catch (e) {
      log("Error in toggleFavAPI: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Operation failed")));
    }
  }
}
