import 'dart:developer';

import '../../config.dart';

class AppSettingProvider with ChangeNotifier {
  int selectIndex = 0;
  final SharedPreferences sharedPreferences;

  AppSettingProvider(this.sharedPreferences);

  heightMQ(context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  widthMQ(context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  onTapData(context, index) {
    log("dsf ssss${index}");
    if (index == 0) {
      route.pushNamed(context, routeName.changeLanguage);
    } else {
      route.pushNamed(context, routeName.signUpVerifyOtp);
    }
  }

  onChangeButton(index) async {
    selectIndex = index;
    notifyListeners();
  }
}
