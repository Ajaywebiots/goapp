import 'dart:async';
import 'dart:developer';

import 'package:goapp/config.dart';

import '../../services/api_service.dart';
import '../../services/user_services.dart';

class VerifyOtpProvider with ChangeNotifier {
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  String? phone, dialCode, verificationCode, min, sec, email;
  bool isCodeSent = false, isCountDown = false, isEmail = false;
  Timer? countdownTimer;
  final FocusNode phoneFocus = FocusNode();
  Duration myDuration = const Duration(seconds: 60);

  onTapVerification(context) {
    // if (otpKey.currentState!.validate()) {
    verifyPhoneOtp(context);
    // }
  }

  //verify phone otp
  verifyPhoneOtp(context) async {
    final ssss = "${api.otpVerify}/${otpController.text}/verify";
    log("ssss dddd $ssss");
    apiServices
        .commonApi(ssss, [], ApiType.patch, isToken: false)
        .then((value) {
      if (value.isSuccess!) {
        log("ssss ${value.data['token']}");
        token = value.data['token'];

        route.pushReplacementNamed(context, routeName.homeScreen);
      }
    });
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

  getArgument(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    /*otpKey = GlobalKey<FormState>();
    if (data['email'] != null) {
      isEmail = true;
      email = data["email"].toString();
    } else {
      isEmail = false;*/
    phone = data["phone"].toString();
    dialCode = data["dialCode"].toString();
    verificationCode = data["verificationCode"].toString();
    startTimer();
    /*}*/
    log("ARG : $data");
    notifyListeners();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    notifyListeners();
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      isCountDown = false;
      countdownTimer!.cancel();
    } else {
      isCountDown = true;
      myDuration = Duration(seconds: seconds);
    }
    notifyListeners();
    String strDigits(int n) => n.toString().padLeft(2, '0');
    min = strDigits(myDuration.inMinutes.remainder(60));
    sec = strDigits(myDuration.inSeconds.remainder(60));
    notifyListeners();
  }

  //resend code
  //send Otp api
  resendOtp(context) async {}
}
