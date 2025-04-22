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
    showLoading(context);
    try {
      apiServices
          .commonApi("${api.otpVerify}/${otpController.text}/verify", [],
              ApiType.patch,
              isToken: false)
          .then((value) {
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            hideLoading(context);
            log("ssss ${value.data['token']}");
            token = value.data['token'];
            route.pushReplacementNamed(context, routeName.dashboard);
          } else {
            hideLoading(context);
            showMessage(context, value.data['responseMessage']);
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, routeName.login, (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      hideLoading(context);
      log("EEEE : verifyPhoneOtp $e");
    }
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
    dynamic data = ModalRoute.of(context)?.settings.arguments;
    phone = data["phone"].toString();
    dialCode = data["dialCode"].toString();
    verificationCode = data["code"].toString();
    otpController.text = data["code"].toString();
    startTimer();
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
  resendOtp(context) async {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    verificationCode = "";
    otpController.text = "";
    try {
      showLoading(context);
      var body = {"phoneNumber": data['phone'], "dialCode": dialCode};
      apiServices
          .commonApi(api.otp, body, ApiType.post, isToken: false)
          .then((value) async {
        if (value.isSuccess!) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          log("token.toString ${token.toString()}");
          await prefs.setString('authToken', token.toString());
          log("ssss ${value.data}");
          log("ssss ${value.data['code']}");
          hideLoading(context);
        }
      });
    } catch (e) {
      log("EEEE : login $e");
    }
  }
}
