import 'dart:developer';

import '../../config.dart';

class VerifyResetPasswordProvider extends ChangeNotifier {
  TextEditingController otpController = TextEditingController();
  bool isCodeSent = false, isCountDown = false, isEmail = false;
  String? phone, dialCode, verificationCode, min, sec, email;
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  getArgument(context) {
    otpKey = GlobalKey<FormState>();
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    email = data["email"].toString();

    log("ARG : $data");
    notifyListeners();
  }

  onTapVerify(context) {
    if (otpKey.currentState!.validate()) {
      verifyOtp(context);
    }
  }

  //verify resetPass otp
  verifyOtp(context) async {
    showLoading(context);
    hideLoading(context);
    route.pushNamed(context, routeName.resetPass,
        arg: {"otp": otpController.text, "email": email});

    /*showLoading(context);
    notifyListeners();

    var body = {"otp": otpController.text, "email": email};
    log("body : $body");

    try {
      await apiServices.postApi(api.verifyOtp, jsonEncode(body)).then((value) {
        hideLoading(context);
        log("SSSS : ${value.isSuccess}");
        notifyListeners();
        if (value.isSuccess!) {
          route.pushNamed(context, routeName.resetPass,
              arg: {"otp": otpController.text, "email": email});
        } else {
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("CATCH verifyOtp: $e");
    }*/
  }

  defaultTheme(context) {
    final defaultPinTheme = PinTheme(
        textStyle:
            appCss.dmDenseSemiBold18.textColor(appColor(context).darkText),
        width: Sizes.s55,
        height: Sizes.s48,
        decoration: BoxDecoration(
            color: appColor(context).whiteBg,
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(color: appColor(context).whiteBg)));
    return defaultPinTheme;
  }

  //send Otp api
  resendOtp(context) async {}
}
