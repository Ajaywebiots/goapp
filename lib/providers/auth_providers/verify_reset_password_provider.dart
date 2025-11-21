import 'dart:developer';
import '../../config.dart';
import '../../services/api_service.dart';

class VerifyResetPasswordProvider extends ChangeNotifier {
  TextEditingController otpController = TextEditingController();
  bool isCodeSent = false, isCountDown = false, isEmail = false;
  String? phone, dialCode, verificationCode, min, sec, phoneNum;
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();

  void getArgument(context) {
    otpKey = GlobalKey<FormState>();
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    phoneNum = data["phoneNumber"].toString();
    otpController.text = data["code"].toString();
    verificationCode = data["code"].toString();
    log("ARG : $data");
    notifyListeners();
  }

  void onTapVerify(context) {
    if (otpKey.currentState!.validate()) {
      try {
        apiServices
            .commonApi("${api.otpVerify}/${otpController.text}/verify", [],
                ApiType.patch)
            .then((value) async {
          if (value.data['responseStatus'] == 1) {
            log("ssss ${value.data['token']}");
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setString(session.accessToken, value.data['token']);
            route.pushNamed(context, routeName.resetPass);
          } else {
            hideLoading(context);
            showMessage( value.data['responseMessage']);
          }
        });
      } catch (e) {
        log("EEEE : onTapVerify $e");
      }
    }
  }

  PinTheme defaultTheme(context) {
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
  Future<void> resendOtp(context) async {}
}
