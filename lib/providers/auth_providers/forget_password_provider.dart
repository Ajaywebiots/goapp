import 'dart:developer';

import 'package:goapp/config.dart';

import '../../services/api_service.dart';

class ForgetPasswordProvider with ChangeNotifier {
  TextEditingController forgetController = TextEditingController();
  GlobalKey<FormState> forgetKey = GlobalKey<FormState>();
  final FocusNode emailFocus = FocusNode();

  onTapSendOtp(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (forgetKey.currentState!.validate()) {
      forgetPassword(context);
    }
  }

  //forget password api
  forgetPassword(context) async {
    apiServices
        .commonApi(api.forgotPassword, [], ApiType.post, isToken: false)
        .then((value) {
      if (value.isSuccess!) {
        log("ssss ${value.data}");
        route.pushReplacementNamed(context, routeName.homeScreen);
      }
    });
    route.pushNamed(context, routeName.verifyOtp, arg: {
      "email": forgetController.text
    }).then((_) => forgetKey.currentState!.reset());
  }
}
