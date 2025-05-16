import 'package:flutter/cupertino.dart';
import '../../config.dart';

class BusinessReviewsProvider extends ChangeNotifier {
  // List<Reviews> reviews = [];
  bool isPositionedRight = false;
  bool isAnimateOver = false;
  AnimationController? controller;
  Animation<Offset>? offsetAnimation;
  int selectedIndex = 3;
  TextEditingController rateController = TextEditingController();
  final FocusNode rateFocus = FocusNode();
  List reviewList = [];

  GlobalKey<FormState> rateKey = GlobalKey<FormState>();

  int? editingReviewId;
  int? exValue = appArray.reviewLowHighList[0]["id"];

  List<Map<String, dynamic>> reviews = [];

  onReview(val) {
    exValue = val;

    notifyListeners();
  }

  void updateReviewShowStatus(int? index, bool value) {
    if (index != null && index < reviews.length) {
      reviews[index]['showReview'] = value;
      notifyListeners();
    }
  }

  void loadReviewForEditing(String reviewText, int ratingIndex, int reviewId) {
    rateController.text = reviewText;
    selectedIndex = ratingIndex;
    editingReviewId = reviewId;
    notifyListeners();
  }
}
