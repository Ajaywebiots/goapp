import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:goapp/config.dart';
import 'package:goapp/services/api_service.dart';

import '../../services/user_services.dart';
import '../app_pages_provider/attractions_provider.dart';
import '../app_pages_provider/categories_list_provider.dart';
import '../app_pages_provider/search_provider.dart';
import '../bottom_providers/dashboard_provider.dart';
import '../bottom_providers/home_screen_provider.dart';
import '../bottom_providers/offer_provider.dart';

class RegisterProvider extends ChangeNotifier {
  bool isNewPassword = true, isConfirmPassword = true, isCheck = false;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> verify = GlobalKey<FormState>();

  String dialCode = "+30";

  TextEditingController enterFName = TextEditingController();
  TextEditingController enterLName = TextEditingController();
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtConfirmPass = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode fNameFocus = FocusNode();
  final FocusNode lNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  //new password see tap
  newPasswordSeenTap() {
    isNewPassword = !isNewPassword;
    notifyListeners();
  }

  //confirm password see tap
  confirmPasswordSeenTap() {
    isConfirmPassword = !isConfirmPassword;
    notifyListeners();
  }

  signUp(context) async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      if (isCheck == false) {
        Fluttertoast.showToast(
            msg: language(context, appFonts.pleaseCheckTerms));
      } else if (registerFormKey.currentState!.validate() && isCheck == true) {
        showLoading(context);
        notifyListeners();
        var body = {
          "phoneNumberPrefix": dialCode,
          "firstName": enterFName.text,
          "lastName": enterLName.text,
          "phoneNumber": txtPhone.text
        };
        log("body : $body");
        apiServices.commonApi(api.register, body, ApiType.post).then((value) {
          if (value.isSuccess == true) {
            log("ssss ${value.data}");
            hideLoading(context);
            phoneOtp(context);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, routeName.login, (Route<dynamic> route) => false);
          }
        });
      }
    } catch (e) {
      log("EEEE : signUp $e");
    }
  }

  phoneOtp(context) {
    try {
      apiServices
          .commonApi(api.otp, {"phoneNumber": txtPhone.text}, ApiType.post,
              isToken: false)
          .then((value) async {
        if (value.isSuccess == true) {
          log("ddd ${value.data}");
          otpController.text = value.data['code'];
          route.pushNamed(context, routeName.signUpVerifyOtp);
        }
      });
    } catch (e) {
      log("EEEE Phone OTP $e");
    }
  }

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

  isCheckBoxCheck(value) {
    isCheck = value;
    notifyListeners();
  }

  onBack() {
    enterFName.text = "";
    enterLName.text = "";
    userNameCtrl.text = "";
    txtEmail.text = "";
    txtPhone.text = "";
    dialCode = "+30";
    txtPass.text = "";
    txtConfirmPass.text = "";
    notifyListeners();
  }

  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }
}
