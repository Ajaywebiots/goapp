import 'dart:async';
import 'dart:developer';

import 'package:goapp/config.dart';
import 'package:goapp/services/api_service.dart';

import '../../models/api_model/home_feed_model.dart';
import '../../models/api_model/offer_search_model.dart';

class OfferProvider extends ChangeNotifier {
  List offerViewAllList = [];

  onReady() {
    getViewAllOfferAPI();
    notifyListeners();
  }

  TextEditingController searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  Timer? debounceTimer;

  OfferProvider() {
    searchCtrl.addListener(onSearchChange);
  }

  void onSearchChange() {
    if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();
    log("rrrrr ssss${searchCtrl.text}");
    // Start a new debounce timer
    debounceTimer = Timer(Duration(milliseconds: 500), () {
      final query = searchCtrl.text.trim();
      log("rrrrr $query");
      if (query.isEmpty) {
        onReady();
      } else if (query.length >= 3) {
        fetchSearchResults(query);
      }
    });
  }

  void fetchSearchResults(String query) {
    try {
      apiServices
          .commonApi("${api.offerSearch}?name=$query", [], ApiType.get,
              isToken: true)
          .then((value) {
        if (value.data['responseStatus'] == 0) {
          offerViewAllList.clear();
          OfferSearchModel offerSearchModel =
              OfferSearchModel.fromJson(value.data);
          offerViewAllList.addAll(offerSearchModel.offers as List<Offer>);
          notifyListeners();
        }
      });
    } catch (e) {
      log("Search error: $e");
    }
  }

  getViewAllOfferAPI() {
    try {
      apiServices
          .commonApi(api.offerSearch, [], ApiType.get, isToken: true)
          .then((value) {
        if (value.data['responseStatus'] == 0) {
          offerViewAllList.clear();
          OfferSearchModel offerSearchModel =
              OfferSearchModel.fromJson(value.data);
          offerViewAllList.addAll(offerSearchModel.offers as List<Offer>);
        }
      });
    } catch (e) {
      log("getViewAllOfferAPI :: $e");
    }
    notifyListeners();
  }

  @override
  void dispose() {
    debounceTimer?.cancel();
    searchCtrl.dispose();
    searchFocus.dispose();
    super.dispose();
  }
}
