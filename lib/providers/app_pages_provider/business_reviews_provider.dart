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

  List<Map<String, dynamic>> allReviews = [];
  List<Map<String, dynamic>> filteredReviews = [];

  void loadInitialReviews(List<Map<String, dynamic>> list) {
    allReviews = List<Map<String, dynamic>>.from(list);
    filteredReviews = List<Map<String, dynamic>>.from(list);
    notifyListeners();
  }

  void onReview(int val) {
    exValue = val;
    if (val == 0) {
      // lowest to highest
      filteredReviews.sort((a, b) => (a['rating'] ?? 0).compareTo(b['rating'] ?? 0));
    } else {
      // highest to lowest
      filteredReviews.sort((a, b) => (b['rating'] ?? 0).compareTo(a['rating'] ?? 0));
    }
    notifyListeners();
  }

  // void updateReviewShowStatus(int? index, bool value) {
  //   if (index != null && index < reviews.length) {
  //     reviews[index]['showReview'] = value;
  //     notifyListeners();
  //   }
  // }

  void loadReviewForEditing(String reviewText, int ratingIndex, int reviewId) {
    rateController.text = reviewText;
    selectedIndex = ratingIndex;
    editingReviewId = reviewId;
    notifyListeners();
  }
}
