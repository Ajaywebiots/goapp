import 'dart:developer';

import 'package:fixit_user/config.dart';

class CategoriesListProvider with ChangeNotifier{
  TextEditingController searchCtrl = TextEditingController();
  bool isGrid = true;
List<CategoryModel> categoryList =[];
  final FocusNode searchFocus = FocusNode();
  int? selectedIndex;

  onGrid(){
    isGrid = !isGrid;
    notifyListeners();
  }


  onReady(context,dash){
    //final dash = Provider.of<DashboardProvider>(context, listen: false);
    categoryList  = dash.categoryList;
    notifyListeners();
  }


  searchCategory(context)async{
    categoryList= [];
    notifyListeners();
    try {
      String apiUrl = api.category;
      if(searchCtrl.text.isNotEmpty){
        apiUrl = "${api.category}?search=${searchCtrl.text}";
      }else{
        apiUrl = api.category;
      }

      log("CATEGIRY");
      await apiServices.getApi(apiUrl, []).then((value) {
        if (value.isSuccess!) {
          List category =value.data;
          for (var data in category.reversed.toList()) {
            if(!categoryList.contains(CategoryModel.fromJson(data))) {
              categoryList.add(CategoryModel.fromJson(data));
            }
            notifyListeners();
          }
        }
      });
      log("categoryList :${categoryList.length}");

    } catch (e) {
      notifyListeners();
    }
    notifyListeners();
  }

}