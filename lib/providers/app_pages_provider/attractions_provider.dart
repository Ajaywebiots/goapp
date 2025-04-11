import 'dart:developer';

import '../../config.dart';
import '../../models/api_model/attraction_categories_model.dart';
import '../../models/api_model/attractions_search_model.dart';
import '../../models/provider_model.dart';
import '../../screens/app_pages_screen/search_screen/layouts/filter_layout.dart';
import '../../services/api_service.dart';
import '../bottom_providers/dashboard_provider.dart';

class AttractionProvider with ChangeNotifier {
  final FocusNode searchFocus = FocusNode();

  List<ProviderModel> searchList = [];
  AnimationController? animationController;
  TextEditingController txtFeaturedSearch = TextEditingController();

  onReady(context) async {
    log("lllllll");
    getAttractionSearchAPI(context);
    notifyListeners();
    getCategoriesData(context);
    notifyListeners();
  }

  List categoryList = [];

  List attractionsSearchList = [];

  getAttractionSearchAPI(context) async {
    showLoading(context);
    final dashboard = Provider.of<DashboardProvider>(context, listen: false);

    Position position = await dashboard.getCurrentLocation();
    double lat = position.latitude;
    double lon = position.longitude;
    try {
      log("hello  kjhdfjkdfjsd  sssss ");
      apiServices
          .commonApi(
              "${api.attractionSearch}?currentLongitude=$lon&currentLatitude=$lat",
              [],
              ApiType.get,
              isToken: true)
          .then((value) {
        log("value.data ${value.data}");
        if (value.data['responseStatus'] == 1) {
          attractionsSearchList.clear();
          AttractionsSearchModel attractionsSearchModel =
              AttractionsSearchModel.fromJson(value.data);

          attractionsSearchList.addAll(attractionsSearchModel.attractions);
          hideLoading(context);
          log("attractionsSearchList $attractionsSearchList");
        }
      });
    } catch (e) {
      hideLoading(context);
      log("getAttractionSearchAPI :::");
    }
  }

  getCategoriesData(context) {
    showLoading(context);
    notifyListeners();
    try {
      apiServices
          .commonApi(api.attractionCategories, [], ApiType.get)
          .then((value) {
        if (value.data['responseStatus'] == 1) {
          notifyListeners();

          log("API Response: attractionCategories ${value.data}");
          AttractionsCategoriesModel categoryModel =
              AttractionsCategoriesModel.fromJson(value.data);
          notifyListeners();
          // Clear old list and add new parsed categories
          categoryList.clear();
          notifyListeners();
          categoryList.addAll(categoryModel.categories ?? []);
          hideLoading(context);
          notifyListeners();
        }
      });
    } catch (e) {
      hideLoading(context);
      log("getCategoriesData $e");
    }
  }

  TextEditingController filterSearchCtrl = TextEditingController();

  onBottomSheet(context, value1) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return FilterLayout(value1);
        }).then((value) {
      log("DDDD");
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      dash.notifyListeners();
      filterSearchCtrl.text = "";
    });
  }

  //featured package list
  getFeaturedPackage(DashboardProvider dash) async {
    searchList = [];
    if (txtFeaturedSearch.text.isNotEmpty) {
      for (var data in dash.highestRateList) {
        if (data.name!
            .toLowerCase()
            .contains(txtFeaturedSearch.text.toLowerCase())) {
          if (!searchList.contains(data)) {
            searchList.add(data);
          }
          notifyListeners();
        }
      }
    } else {
      notifyListeners();
    }
  }

  onBack(DashboardProvider dash, context) {
    txtFeaturedSearch.text = "";
    searchList = [];
    notifyListeners();
    getFeaturedPackage(dash);
    route.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
