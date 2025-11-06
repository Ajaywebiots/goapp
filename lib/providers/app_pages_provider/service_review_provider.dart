import 'dart:developer';
import 'package:flutter/material.dart';
import '../../config.dart';
import '../../models/api_model/review_list_model.dart';
import '../../services/api_service.dart';

class ServiceReviewProvider with ChangeNotifier {
  int? exValue = appArray.reviewLowHighList[0]["id"];
  List<Review> reviewList = [];
  List<Review> allReviews = [];
  List<Review> filteredReviews = [];

  ReviewListModel? reviewListData;

  void loadInitialReviews(List<Review> list) {
    allReviews = List<Review>.from(list);
    filteredReviews = List<Review>.from(list);
    notifyListeners();
  }

  void onReview(int? val) {
    exValue = val ?? 0;
    if (reviewListData?.reviews == null) return;

    filteredReviews = List<Review>.from(reviewListData!.reviews);

    if (exValue == 0) {
      // Lowest → Highest
      filteredReviews.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
    } else {
      // Highest → Lowest
      filteredReviews.sort((a, b) => (a.rating ?? 0).compareTo(b.rating ?? 0));
    }

    log("Filtered list (${exValue == 0 ? 'Low→High' : 'High→Low'}): ${filteredReviews.map((r) => r.rating).toList()}");
    notifyListeners();
  }

  Future<void> onReady(BuildContext context) async {
    notifyListeners();
  }

  void businessReviewListAPI({int? id}) {
    apiServices
        .commonApi("${api.businessReviewsList}$id/reviews", [], ApiType.get)
        .then((value) {
      ReviewListModel reviewListModel = ReviewListModel.fromJson(value.data);
      reviewListData = reviewListModel;
      filteredReviews =
      List<Review>.from(reviewListModel.reviews ?? <Review>[]);
      notifyListeners();
    });
  }

  void attractionsReviewListAPI({int? id}) {
    apiServices
        .commonApi("${api.attractionReviewsList}$id/reviews", [], ApiType.get)
        .then((value) {
      ReviewListModel reviewListModel = ReviewListModel.fromJson(value.data);
      reviewListData = reviewListModel;
      filteredReviews =
      List<Review>.from(reviewListModel.reviews ?? <Review>[]);
      notifyListeners();
    });
  }
}
