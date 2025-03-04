import 'dart:developer';

import 'package:goapp/config.dart';

import '../../services/api_service.dart';
import '../../services/user_services.dart';

class LoginWithPhoneProvider with ChangeNotifier {
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isCodeSent = false;
  String dialCode = "+91";
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
          if (value.isSuccess!) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            log("token.toString ${token.toString()}");
            await prefs.setString('authToken', token.toString());
            log("ssss ${value.data}");
            log("ssss ${value.data['code']}");
            hideLoading(context);
            route.pushNamed(context, routeName.loginPhoneOtpVerifyScreen, arg: {
              "phone": numberController.text,
              "dialCode": dialCode,
              "code": value.data['code']
            });
          }
        });
      } catch (e) {
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
