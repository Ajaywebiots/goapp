import 'dart:developer';

import '../../config.dart';
import '../../models/review_model.dart';
import '../../models/service_model.dart';

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
    notifyListeners();
  }

  getReviewByServiceId(serviceId) async {
    reviewList = [];
    reviewList = appArray.allReview.map((e) => Reviews.fromJson(e)).toList();
    notifyListeners();
    log("REV :${reviewList.length}");
  }
}
