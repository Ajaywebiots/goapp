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

  Future<void> onTapVerification(context) async {
    final sss = Provider.of<LoginWithPhoneProvider>(context, listen: false);

    if (!otpKey.currentState!.validate()) return;

    showLoading(context);
    try {
      await apiServices
          .commonApi("${api.otpVerify}/${otpController.text}/verify", [],
              ApiType.patch,
              isToken: false)
          .then((value) async {
        if (value.isSuccess == true) {

          log("value = > data ${value.data}");
          hideLoading(context);
          final SharedPreferences pref = await SharedPreferences.getInstance();
          token = value.data['token'];

          await pref.setInt(session.id, value.data['user']['id']);
          await pref.setString(session.accessToken, value.data['token']);
          await pref.setString(session.tokenExpiration, value.data['expiration']);
          await pref.setString(session.loginSession, value.data['loginSession']);

          final homePvr =
              Provider.of<HomeScreenProvider>(context, listen: false);
          final searchPvr = Provider.of<SearchProvider>(context, listen: false);
          final attractionPvr =
              Provider.of<AttractionProvider>(context, listen: false);
          final offerPvr = Provider.of<OfferProvider>(context, listen: false);
          final dash = Provider.of<DashboardProvider>(context, listen: false);
          final catListPvr =
              Provider.of<CategoriesListProvider>(context, listen: false);

          homePvr.homeFeed(context);
          searchPvr.getBusinessSearchAPI(context, isFilter: false);
          attractionPvr.getAttractionSearchAPI(context);
          offerPvr.getViewAllOfferAPI();
          catListPvr.getCategoriesData(context);
          offerPvr.getCategoriesData(context);

          dash.selectIndex = 0;
          route.pushNamedAndRemoveUntil(context, routeName.dashboard);
          sss.email.text = "";
          sss.numberController.text = "";
          log("onTapVerification success ${value.message}");
        } else {
          hideLoading(context);
          log("onTapVerification failed ${value.message}");
          showMessage(context, value.message);
        }
      });
    } catch (e,s) {
      hideLoading(context);
      log("Error verifying OTP: $e----$s");
      showMessage(context, 'An unexpected error occurred.');
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

  // getArgument(context) {
  //   dynamic data = ModalRoute.of(context)?.settings.arguments;
  //   phone = data["phoneNumber"].toString();
  //   dialCode = data["phoneNumberPrefix"].toString();
  //   // verificationCode = data["code"].toString();
  //   // otpController.text = data["code"].toString();
  //   startTimer();
  //   log("ARG : $data");
  //   notifyListeners();
  // }

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
  Future<void> resendOtp(context) async {
    final sss = Provider.of<LoginWithPhoneProvider>(context, listen: false);
    try {
      showLoading(context);
      var body = sss.selectedMethod == ContactMethod.email
          ? {"email": sss.email.text}
          : {
              "phoneNumber": sss.numberController.text,
              "phoneNumberPrefix": sss.dialCode
            };

      log("body $body");
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
