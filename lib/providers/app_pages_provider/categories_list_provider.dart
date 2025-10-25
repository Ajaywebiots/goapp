import 'dart:developer';

import 'package:goapp/services/api_service.dart';

import '../../config.dart';
import '../../models/api_model/business_category_model.dart';

class CategoriesListProvider with ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();
  bool isGrid = true;

  // List<CategoryModel> categoryList = [];
  List categoryList = [];
  final FocusNode searchFocus = FocusNode();
  int? selectedIndex;

  void onGrid() {
    isGrid = !isGrid;
    notifyListeners();
  }

  Categories? _selectedCategory;
  int? _selectedCategoryIndex;

  Categories? get selectedCategory => _selectedCategory;
  int? get selectedCategoryIndex => _selectedCategoryIndex;

  void selectCategory(Categories category, int index) {
    _selectedCategory = category;
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  /*onReady(context) {
    //final dash = Provider.of<DashboardProvider>(context, listen: false);
    // categoryList = dash.categoryList;

    // getCategoriesData(context);
    notifyListeners();
  }*/

  void getCategoriesData(context) {
    // showLoading(context);
    notifyListeners();
    apiServices
        .commonApi(api.businessCategories, [], ApiType.get)
        .then((value) {
      if (value.isSuccess == true) {
        notifyListeners();
        // hideLoading(context);
        log("API Response: ${value.data}");
        BusinessCategoriesModel categoryModel =
            BusinessCategoriesModel.fromJson(value.data);
        notifyListeners();
        // Clear old list and add new parsed categories
        categoryList.clear();
        notifyListeners();
        categoryList.addAll(categoryModel.categories ?? []);
        notifyListeners();
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, routeName.login, (Route<dynamic> route) => false);
      }
    });
  }

  Future<void> searchCategory(context, DashboardProvider dash) async {
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
