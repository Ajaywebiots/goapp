import 'dart:async';
import 'dart:developer';

import 'package:goapp/config.dart';

import '../../services/api_service.dart';
import '../../services/user_services.dart';
import '../app_pages_provider/attractions_provider.dart';
import '../app_pages_provider/categories_list_provider.dart';
import '../app_pages_provider/search_provider.dart';
import '../bottom_providers/dashboard_provider.dart';
import '../bottom_providers/home_screen_provider.dart';
import '../bottom_providers/offer_provider.dart';

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
          .then((value) async {
        if (value.isSuccess == true) {
          if (value.data['responseStatus'] == 1) {
            hideLoading(context);
            log("ssss ${value.data['token']}");
            token = value.data['token'];
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setInt(session.id, value.data['user']['id']);
            await pref.setString(session.accessToken, value.data['token']);
            log("token session.id ${pref.getInt(session.id)}");
            log("accessToken ${pref.getString(session.accessToken)}");

            pref.setString(session.tokenExpiration, value.data['expiration']);

            final homePvr =
                Provider.of<HomeScreenProvider>(context, listen: false);
            final searchPvr =
                Provider.of<SearchProvider>(context, listen: false);
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
    phone = data["phoneNumber"].toString();
    dialCode = data["phoneNumberPrefix"].toString();
    // verificationCode = data["code"].toString();
    // otpController.text = data["code"].toString();
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
      var body = {"phoneNumber": data['phone'], "phoneNumberPrefix": dialCode};
      log("body ${body}");
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
