import 'dart:developer';

import 'package:goapp/config.dart';

import '../../services/api_service.dart';

class LoginWithPhoneProvider with ChangeNotifier {
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> globalKey1 = GlobalKey<FormState>();
  bool isCodeSent = false;
  String dialCode = "+91";
  final FocusNode phoneFocus = FocusNode();
  String? verificationCode;

  onTapOtp(context) async {
    final aaa = Provider.of<VerifyOtpProvider>(context, listen: false);
    aaa.otpController.text = "";
    FocusManager.instance.primaryFocus?.unfocus();
    if (globalKey.currentState!.validate()) {
      // showLoading(context);
      // hideLoading(context);
      route.pushNamed(context, routeName.verifyOtp, arg: {
        "phone": numberController.text,
        "dialCode": dialCode,
        "verificationCode": verificationCode
      });
      notifyListeners();
      // sendOtp(context);
    } else if (globalKey1.currentState!.validate()) {
      // showLoading(context);
      // hideLoading(context);
      route.pushNamed(context, routeName.verifyOtp, arg: {
        "phone": numberController.text,
        "dialCode": dialCode,
        "verificationCode": verificationCode
      });
      notifyListeners();
      // sendOtp(context);
    }
  }

  //send Otp api
  sendOtp(context) async {
    showLoading(context);
    notifyListeners();

    var body = {"phoneNumber": numberController.text};

    apiServices.commonApi(api.otp, body, ApiType.post).then((value) {
      if (value.isSuccess!) {
        hideLoading(context);
        log("ssss ${value.data}");
      }
    });
  }

  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }
}
