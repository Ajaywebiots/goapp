import 'dart:developer';

import '../../config.dart';
import '../../models/api_model/review_list_model.dart';
import '../../models/review_model.dart';
import '../../models/service_model.dart';
import '../../services/api_service.dart';

class ServiceReviewProvider with ChangeNotifier {
  int? exValue = appArray.reviewLowHighList[0]["id"];
  Services? services;
  List<Reviews> reviewList = [];

  onReview(val) {
    exValue = val;

    notifyListeners();
    getReviewByServiceId(services?.id);
  }

  onReady(context) async {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    log("DATA : $data");
    services = data;
    getReviewByServiceId(services?.id);
    // businessReviewListAPI();
    notifyListeners();
  }

  getReviewByServiceId(serviceId) async {
    reviewList = [];
    reviewList = appArray.allReview.map((e) => Reviews.fromJson(e)).toList();
    notifyListeners();
    log("REV :${reviewList.length}");
  }

  // List businessReviewList = [];

  ReviewListModel? reviewListData;
  businessReviewListAPI({int? id}) {
    notifyListeners();
    apiServices
        .commonApi("${api.businessReviewsList}$id/reviews", [], ApiType.get)
        .then((value) {
      log("sss ${value.data}");
      notifyListeners();
      ReviewListModel reviewListModel = ReviewListModel.fromJson(value.data);
      reviewListData = reviewListModel;
    });
    notifyListeners();
  }

  attractionsReviewListAPI({int? id}) {
    notifyListeners();
    apiServices
        .commonApi("${api.attractionReviewsList}$id/reviews", [], ApiType.get)
        .then((value) {
      log("sss ${value.data}");
      notifyListeners();
      ReviewListModel reviewListModel = ReviewListModel.fromJson(value.data);
      reviewListData = reviewListModel;
    });
    notifyListeners();
  }

/* businessReviewListAPI() {
    apiServices
        .commonApi(api.businessReviewsList, [], ApiType.get)
        .then((value) {
      if (value.data['responseStatus'] == 1) {
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
      }
    });
  }*/
}
