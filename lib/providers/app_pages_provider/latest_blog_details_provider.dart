import 'dart:developer';

import '../../config.dart';
import '../../models/blog_model.dart';

class LatestBLogDetailsProvider with ChangeNotifier {
  BlogModel? data;

  onReady(context) {
    dynamic data1 = ModalRoute.of(context)!.settings.arguments;
    data = data1;
    notifyListeners();
  }

  bool isLike = false;

  setState() {
    notifyListeners();
  }

  likeDislike() {
    isLike = !isLike;
    notifyListeners();
  }
}
