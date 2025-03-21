import 'dart:developer';

import 'package:goapp/services/api_service.dart';

import '../../config.dart';
import '../../models/api_model/category_model.dart';
import '../../models/category_model.dart';
import '../bottom_providers/dashboard_provider.dart';

class CategoriesListProvider with ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();
  bool isGrid = true;

  // List<CategoryModel> categoryList = [];
  List categoryList = [];
  final FocusNode searchFocus = FocusNode();
  int? selectedIndex;

  onGrid() {
    isGrid = !isGrid;
    notifyListeners();
  }

  onReady(context, DashboardProvider dash) {
    //final dash = Provider.of<DashboardProvider>(context, listen: false);
    // categoryList = dash.categoryList;

    getCategoriesData(context);
    notifyListeners();
  }

  getCategoriesData(context) {
    showLoading(context);
    notifyListeners();
    apiServices
        .commonApi(api.businessCategories, [], ApiType.get)
        .then((value) {
      if (value.data['responseStatus'] == 1) {
        notifyListeners();
        hideLoading(context);
        log("API Response: ${value.data}");
        CategoryModelAPI categoryModel = CategoryModelAPI.fromJson(value.data);
        notifyListeners();
        // Clear old list and add new parsed categories
        categoryList.clear();
        notifyListeners();
        categoryList.addAll(categoryModel.categories ?? []);
        notifyListeners();
      }
    });
  }

  searchCategory(context, DashboardProvider dash) async {
    categoryList = [];
    notifyListeners();
    /*try {
      if (searchCtrl.text.isNotEmpty) {
        for (var data in dash.categoryList) {
          if (data.title!
              .toLowerCase()
              .contains(searchCtrl.text.replaceAll(" ", "").toLowerCase())) {
            if (!categoryList.contains(data)) {
              categoryList.add(data);
            }
            notifyListeners();
          }
        }
      } else {
        // categoryList = dash.categoryList;
        notifyListeners();
      }
    } catch (e) {
      notifyListeners();
    }*/
    notifyListeners();
  }
}
