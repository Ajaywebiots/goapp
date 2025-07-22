import 'dart:developer';
import 'package:goapp/config.dart';
import 'package:goapp/services/api_service.dart';

class CommonApiProvider extends ChangeNotifier {
  Future<void> toggleFavAPI(
      context, isFavorite, int? appObjectType, int? appObjectId,
      {VoidCallback? onSuccess}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);
    notifyListeners();
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("User not logged in",
              style: appCss.dmDenseRegular16
                  .textColor(appColor(context).primary))));
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
      notifyListeners();
    } catch (e, s) {
      log("Error in toggleFavAPI: $e ---->> $s");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Operation failed",
              style: appCss.dmDenseRegular16
                  .textColor(appColor(context).primary))));
    }
  }
}
