import 'dart:developer';

import '../../config.dart';
import '../../models/api_model/blog_categories_model.dart';
import '../../models/api_model/home_feed_model.dart';
import '../../models/blog_model.dart';
import '../../services/api_service.dart';

class LatestBLogDetailsProvider with ChangeNotifier {
  Article? data;

  onReady(context) {
    dynamic data1 = ModalRoute.of(context)!.settings.arguments;
    data = data1;
    blogCategoriesData(context);
    notifyListeners();
  }

  bool isLike = false;

  setState() {
    notifyListeners();
  }

  List categoryList = [];

  blogCategoriesData(context) {
    showLoading(context);
    notifyListeners();
    apiServices.commonApi(api.blogCategories, [], ApiType.get).then((value) {
      if (value.data['responseStatus'] == 1) {
        notifyListeners();
        hideLoading(context);
        log("API Response: blogCategory ${value.data}");
        BlogCategoriesModel blogCategoryModel =
            BlogCategoriesModel.fromJson(value.data);
        notifyListeners();
        // Clear old list and add new parsed categories
        categoryList.clear();
        notifyListeners();
        categoryList.addAll(blogCategoryModel.blogCategories ?? []);
        notifyListeners();
      }
    });
  }

  likeDislike() {
    data!.isFavourite = !data!.isFavourite;
    notifyListeners();
  }
}
