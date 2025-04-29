import 'package:flutter/cupertino.dart';

import '../../config.dart';
import '../../models/api_model/my_review_model.dart';
import '../../services/api_service.dart';

class MyReviewProvider extends ChangeNotifier {
  // List<Reviews> reviews = [];
  bool isPositionedRight = false;
  bool isAnimateOver = false;
  AnimationController? controller;
  Animation<Offset>? offsetAnimation;
  int selectedIndex = 3;
  TextEditingController rateController = TextEditingController();
  final FocusNode rateFocus = FocusNode();

  GlobalKey<FormState> rateKey = GlobalKey<FormState>();

  onSubmit(context) {
    route.pop(context);
    // FocusScope.of(context).requestFocus(FocusNode());
    // // if (rateKey.currentState!.validate()) {
    //   if (isServiceRate) {
    //     rateService(context);
    //   } else {
    //     if (selectedIndex == 4) {
    //       //  rateBuilder(context);
    //       rateApp(context);
    //     } else {
    //       // route.pushNamed(context, routeName.contactUs,
    //       //     arg: {'rate': selectedIndex, "desc": rateController.text});
    //     }
    //   }
    // }
  }

  List<Review> reviewList = [];

  getMyReviewListData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);
    reviewList.clear();
    apiServices
        .commonApi("${api.review}$userId/reviews", [], ApiType.get,
            isToken: true)
        .then((value) {
      MyReviewModel myReviewModel = MyReviewModel.fromJson(value.data);

      reviewList.addAll(myReviewModel.reviews);
    });
  }

  onTapEmoji(index) {
    selectedIndex = index;
    notifyListeners();
  }

  animateDesign(TickerProvider sync) {
    Future.delayed(DurationClass.s1).then((value) {
      isPositionedRight = true;
      notifyListeners();
    }).then((value) {
      Future.delayed(DurationClass.ms150).then((value) {
        isAnimateOver = true;
        notifyListeners();
      }).then((value) {
        controller = AnimationController(
            vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
        offsetAnimation = Tween<Offset>(
                begin: const Offset(0, 0.5), end: const Offset(0, 0.88))
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        notifyListeners();
      });
    });
    notifyListeners();
  }

  //delete review
  deleteReview(context, id, {isBack = false}) async {
    showLoading(context);
    route.pop(context);

    completeSuccess(context, isBack);
  }

  completeSuccess(context, isBack) {
    showCupertinoDialog(
        context: context,
        builder: (context1) {
          return AlertDialogCommon(
              title: appFonts.successfullyDelete,
              height: Sizes.s140,
              image: eGifAssets.successGif,
              subtext: language(context, "Review Deleted Successfully"),
              bText1: language(context, appFonts.okay),
              b1OnTap: () {
                route.pop(context);
              });
        });
  }
}
