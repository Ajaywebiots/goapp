import 'dart:developer';

import 'package:goapp/config.dart';

import '../../services/api_service.dart';
import '../../services/user_services.dart';

class LoginWithPhoneProvider with ChangeNotifier {
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isCodeSent = false;
  String dialCode = "+30";
  final FocusNode phoneFocus = FocusNode();
  String? verificationCode;

  onTapOtp(context) {
    verificationCode = "";
    FocusManager.instance.primaryFocus?.unfocus();
    if (globalKey.currentState!.validate()) {
      try {
        showLoading(context);
        var body = {"phoneNumber": numberController.text, "dialCode": dialCode};
        apiServices
            .commonApi(api.otp, body, ApiType.post, isToken: false)
            .then((value) async {
          log("dasdasdasd ${value.data}");
          if (value.data['code'].isNotEmpty) {
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // log("token.toString ${token.toString()}");
            // await prefs.setString('authToken', token.toString());
            log("ssss ${value.data}");
            log("ssss ${value.data['code']}");
            hideLoading(context);
            route.pushNamed(context, routeName.loginPhoneOtpVerifyScreen, arg: {
              "phone": numberController.text,
              "dialCode": dialCode,
              "code": value.data['code']
            });
          } else {
            hideLoading(context);
            showMessage(context, value.data['responseMessage']);
          }
        });
      } catch (e) {
        hideLoading(context);
        log("EEEE : login $e");
      }
    }
  }

  ////
  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }
}
