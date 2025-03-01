import 'dart:developer';

import 'package:goapp/config.dart';

import '../../services/api_service.dart';

class ForgetPasswordProvider with ChangeNotifier {
  TextEditingController forgetController = TextEditingController();
  GlobalKey<FormState> forgetKey = GlobalKey<FormState>();
  final FocusNode emailFocus = FocusNode();

  onTapSendOtp(context) {
    final aaa = Provider.of<VerifyOtpProvider>(context, listen: false);
    aaa.otpController.text = "";
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

    /* showLoading(context);
    var body = {
      "email": forgetController.text,
    };
    try {
      await apiServices.postApi(api.forgotPassword, jsonEncode(body)).then((value) {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          log("dfdxf : $value");

          route.pushNamed(context, routeName.verifyOtp,arg: {"email":forgetController.text});

          forgetController.text ="";
          notifyListeners();
        } else {
          log("dfdxf : $value");
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("CATCH forgetPassword: $e");
    }*/
  }
}
