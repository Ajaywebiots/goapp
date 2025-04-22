import 'dart:developer';

import 'package:goapp/models/api_model/articles_search_model.dart';
import 'package:goapp/models/api_model/attractions_search_model.dart';
import 'package:goapp/models/api_model/business_list_model.dart';
import 'package:goapp/models/api_model/offer_search_model.dart';
import 'package:goapp/services/api_service.dart';

import '../../config.dart';
import '../../models/api_model/home_feed_model.dart';
import '../bottom_providers/home_screen_provider.dart';

class FavouriteListProvider with ChangeNotifier {
  int selectIndex = 0;

  onFilter(index) {
    selectIndex = index;
    notifyListeners();
  }

  List<Offer> offerList = [];

  final List<Business> businessList = [];
  final List<Attraction> attractionList = [];
  final List<Article> blogList = [];

  favOfferListDataAPI(context) async {
    notifyListeners();
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    Position position = await homePvr.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);
    notifyListeners();
    try {
      apiServices
          .commonApi(
              "${api.favList}$userId/favorites/offers?currentLongitude=$lon&currentLatitude=$lat",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        notifyListeners();
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            offerList.clear();

            notifyListeners();
            OfferSearchModel offerSearchModel =
                OfferSearchModel.fromJson(value.data);
            offerList.addAll(offerSearchModel.offers as List<Offer>);
            notifyListeners();
            log("offerList $offerList");
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      log("EEEE favListDataAPI::: $e");
    }
  }

  bool isExpanded = false;
  String selectedOption = 'Offer List';
  final List options = [
    'Offer List',
    'Business List',
    'Points of Interest List',
    'Article List'
  ];

  void toggleDropdown() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void selectOption(String option) {
    selectedOption = option;
    isExpanded = false;
    notifyListeners();
  }

  favBusinessListDataAPI(context) async {
    notifyListeners();
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    Position position = await homePvr.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);
    notifyListeners();
    try {
      apiServices
          .commonApi(
              "${api.favList}$userId/favorites/businesses?currentLongitude=$lon&currentLatitude=$lat",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        notifyListeners();
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            businessList.clear();

            notifyListeners();
            BusinessSearchModel businessSearchModel =
                BusinessSearchModel.fromJson(value.data);
            businessList.addAll(businessSearchModel.businesses);
            notifyListeners();
            log("offerList $businessList");
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      log("EEEE favListDataAPI::: $e");
    }
  }

  favAttractionsListDataAPI(context) async {
    notifyListeners();
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    Position position = await homePvr.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);
    notifyListeners();
    try {
      apiServices
          .commonApi(
              "${api.favList}$userId/favorites/attractions?currentLongitude=$lon&currentLatitude=$lat",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        notifyListeners();
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            attractionList.clear();

            notifyListeners();
            AttractionsSearchModel businessSearchModel =
                AttractionsSearchModel.fromJson(value.data);
            attractionList.addAll(businessSearchModel.attractions);
            notifyListeners();
            log("offerList $attractionList");
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      log("EEEE favListDataAPI::: $e");
    }
  }

  favBlogListDataAPI(context) async {
    notifyListeners();
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    Position position = await homePvr.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);
    notifyListeners();
    try {
      apiServices
          .commonApi(
              "${api.favList}$userId/favorites/blogs?currentLongitude=$lon&currentLatitude=$lat",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        notifyListeners();
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            blogList.clear();

            notifyListeners();
            ArticlesSearchModel blogSearchModel =
                ArticlesSearchModel.fromJson(value.data);
            blogList.addAll(blogSearchModel.articles);
            notifyListeners();
            log("offerList $blogList");
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      log("EEEE favListDataAPI::: $e");
    }
  }
}
