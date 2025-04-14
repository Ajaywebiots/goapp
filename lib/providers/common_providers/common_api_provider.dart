import 'dart:developer';

import 'package:goapp/config.dart';
import 'package:goapp/providers/bottom_providers/dashboard_provider.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';
import 'package:goapp/services/api_service.dart';

class CommonApiProvider extends ChangeNotifier {
  Future<void> toggleFavAPI(
      context, isFavorite, int appObjectType, int appObjectId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);

    if (userId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("User not logged in")));
      return;
    }

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
      } else {
        log("Add to favorites $isFavorite");
        // Add to favorites
        final response = await apiServices.commonApi(
            "${api.addFav}$userId/favorites/$appObjectType/$appObjectId",
            [],
            ApiType.post,
            isToken: true);
        log("Added to favorites: ${response.data}");
      }
      final home = Provider.of<DashboardProvider>(context, listen: false);
      home.homeFeed(context);
    } catch (e) {
      log("Error in toggleFavAPI: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Operation failed")));
    }
  }
}
